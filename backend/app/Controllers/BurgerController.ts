import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema, rules } from '@ioc:Adonis/Core/Validator'
import BurgerService from 'App/Services/BurgerService';

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
})

const updateBurgerSchema = schema.create({
    name: schema.string.optional(),
    published: schema.boolean.optional(),
    ingredients: schema.array.optional().members(schema.object().members({
        id: schema.string(),
        amount: schema.number(),
        index: schema.number([
            rules.unsigned()
        ])
    })),
})

const addBurgerRatingSchema = schema.create({
    rating: schema.number([
        rules.range(-1, 1)
    ]),
})

export default class BurgerController {
    private readonly burgerService = new BurgerService()

    public async index({ request, response, keeper }: HttpContextContract) {
        const validated = await request.validate({ schema: indexBurgerSchema })

        const currentKeeperId = keeper?.id

        const burgers = await this.burgerService.listBurgers({
            ...validated,
            published: validated.published == null ? null : validated.published === "true"
        }, currentKeeperId)

        response.status(200).json({
            status: "success",
            data: burgers,
            count: burgers.length
        })
    }

    public async show({ request, response }: HttpContextContract) {
        const id = request.param("id")
        const keeperId = request.param("keeperId") ?? ''

        const burger = await this.burgerService.getBurger(id, keeperId)

        response.status(200).json({
            status: "success",
            data: burger
        })
    }

    public async store({ request, response, keeper }: HttpContextContract) {
        const validated = await request.validate({
            schema: createBurgerSchema
        })

        const burger = await this.burgerService.createBurger(keeper!, validated)

        response.status(201).json({
            status: "success",
            data: burger
        })
    }

    public async update({ request, response, keeper }: HttpContextContract) {
        const validated = await request.validate({
            schema: updateBurgerSchema
        })

        const burgerId = request.param("id")

        const currentKeeperId = keeper?.id

        const burger = await this.burgerService.updateBurger(burgerId, validated, currentKeeperId)

        response.status(200).json({
            data: burger,
            status: "success"
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
