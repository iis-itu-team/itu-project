import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema, rules } from '@ioc:Adonis/Core/Validator'
import FailureException from 'App/Exceptions/FailureException';

import FoodService from "App/Services/FoodService";
import KeeperService from 'App/Services/KeeperService';

const indexFoodSchema = schema.create({
    published: schema.enum.optional(["true", "false"]),
    keeperId: schema.string.optional()
})

const createFoodSchema = schema.create({
    publish: schema.boolean(),
    name: schema.string(),
    ingredients: schema.array().members(schema.object().members({
        id: schema.string(),
        amount: schema.number(),
    })),
    keeperId: schema.string()
})

export default class FoodController {
    private readonly foodService = new FoodService()
    private readonly keeperService = new KeeperService()

    public async index({ request, response }: HttpContextContract) {
        const validated = await request.validate({ schema: indexFoodSchema })

        const foods = await this.foodService.listFoods({
            ...validated,
            published: validated.published == null ? null : validated.published === "true"
        })

        response.status(200).json({
            status: "success",
            data: foods,
            count: foods.length
        })
    }

    public async show({ request, response }: HttpContextContract) {
        const id = request.param("id")

        const food = await this.foodService.getFood(id)

        response.status(200).json({
            status: "success",
            data: food
        })
    }

    public async store({ request, response }: HttpContextContract) {
        const validated = await request.validate({
            schema: createFoodSchema
        })

        const keeper = await this.keeperService.getKeeper(validated.keeperId)

        if (!keeper) {
            throw FailureException.notFound("keeper", validated.keeperId)
        }

        const food = await this.foodService.createFood(keeper, validated)

        response.status(201).json({
            status: "success",
            data: food
        })
    }

    public async destroy({ request, response }: HttpContextContract) {
        const id = request.param("id")

        await this.foodService.deleteFood(id)

        response.status(200).json({
            status: "success"
        })
    }
}
