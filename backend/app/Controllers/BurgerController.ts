import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema } from '@ioc:Adonis/Core/Validator'
import FailureException from 'App/Exceptions/FailureException';
import BurgerService from 'App/Services/BurgerService';
import KeeperService from 'App/Services/KeeperService';

const indexBurgerSchema = schema.create({
    published: schema.enum.optional(["true", "false"]),
    keeperId: schema.string.optional()
})

const createBurgerSchema = schema.create({
    publish: schema.boolean(),
    name: schema.string(),
    ingredients: schema.array().members(schema.object().members({
        id: schema.string(),
        amount: schema.number(),
    })),
    keeperId: schema.string()
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

    public async destroy({ request, response }: HttpContextContract) {
        const id = request.param("id")

        await this.burgerService.deleteBurger(id)

        response.status(200).json({
            status: "success"
        })
    }
}
