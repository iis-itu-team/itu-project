import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema } from '@ioc:Adonis/Core/Validator'

import FoodService from "App/Services/FoodService";

const indexFoodSchema = schema.create({
    published: schema.boolean.optional()
})

const createFoodSchema = schema.create({
    publish: schema.boolean(),
    name: schema.string(),
    ingredients: schema.array().members(schema.object().members({
        id: schema.string(),
        amount: schema.number(),
    }))
})

export default class FoodController {
    private readonly foodService = new FoodService()

    public async index({ request, response }: HttpContextContract) {
        const validated = await request.validate({ schema: indexFoodSchema })

        const foods = await this.foodService.listFoods(validated)

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

        const food = await this.foodService.createFood(validated)

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
