import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema, rules } from '@ioc:Adonis/Core/Validator'
import FailureException from 'App/Exceptions/FailureException';
import BurgerService from 'App/Services/BurgerService';
import KeeperService from 'App/Services/KeeperService';

const indexBurgerSchema = schema.create({
    published: schema.enum.optional(["true", "false"]),
    keeperId: schema.string.optional()
})

const createBurgerSchema = schema.create({
    name: schema.string(),
    published: schema.boolean(),
    ingredients: schema.array().members(schema.object().members({
        id: schema.string(),
        amount: schema.number(),
        index: schema.number([
            rules.unsigned()
        ])
    })),
    keeperId: schema.string()
})

const addBurgerRatingSchema = schema.create({
    rating: schema.number([
        rules.range(-1, 1)
    ]),
})

export default class BurgerController {
    private readonly burgerService = new BurgerService()
    private readonly keeperService = new KeeperService()

    public async index({ request, response }: HttpContextContract) {
        const validated = await request.validate({ schema: indexBurgerSchema })

        const burgers = await this.burgerService.listBurgers({
            ...validated,
            published: validated.published == null ? null : validated.published === "true"
        })

        response.status(200).json({
            status: "success",
            data: burgers,
            count: burgers.length
        })
    }

    public async show({ request, response }: HttpContextContract) {
        const id = request.param("id")

        const burger = await this.burgerService.getBurger(id)

        response.status(200).json({
            status: "success",
            data: burger
        })
    }

    public async store({ request, response }: HttpContextContract) {
        const validated = await request.validate({
            schema: createBurgerSchema
        })

        const keeper = await this.keeperService.getKeeper(validated.keeperId)

        if (!keeper) {
            throw FailureException.notFound("keeper", validated.keeperId)
        }

        const burger = await this.burgerService.createBurger(keeper, validated)

        response.status(201).json({
            status: "success",
            data: burger
        })
    }

    public async rate({ request, response, keeper }: HttpContextContract) {
        const validated = await request.validate({
            schema: addBurgerRatingSchema
        })

        const burgerId = request.param('burger_id')

        // keeper required middleware
        const keeperId = keeper!.id;

        const burger = await this.burgerService.rateBurger(burgerId, keeperId, validated.rating)

        response.status(200).json({
            status: "success",
            data: burger
        })
    }

    public async destroy({ request, response }: HttpContextContract) {
        const id = request.param("id")

        await this.burgerService.deleteBurger(id)

        response.status(200).json({
            status: "success"
        })
    }
}
