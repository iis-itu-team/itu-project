import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import IngredientService from 'App/Services/IngredientService'
import { schema, rules } from "@ioc:Adonis/Core/Validator"

const createIngredientSchema = schema.create({
    name: schema.string(),
    price: schema.number([
        rules.unsigned()
    ]),
    category: schema.string()
})

const updateIngredientSchema = schema.create({
    name: schema.string.optional(),
    price: schema.number.optional([
        rules.unsigned()
    ]),
    category: schema.string()
})

export default class IngredientController {
    private readonly ingredientService = new IngredientService();

    public async listCategories({ response }: HttpContextContract) {
        const categories = await this.ingredientService.listCategories()

        response.status(200).json({
            data: categories,
            count: categories.length,
            status: "success"
        })
    }

    public async index({ response }: HttpContextContract) {
        const ingredients = await this.ingredientService.listIngredients()

        response.status(200).json({
            status: "success",
            data: ingredients,
            count: ingredients.length
        })
    }

    public async show({ request, response }: HttpContextContract) {
        const id = request.param("id")

        const ingredient = await this.ingredientService.getIngredient(id)

        response.status(200).json({
            status: "success",
            data: ingredient
        })
    }

    public async store({ request, response }: HttpContextContract) {
        const validated = await request.validate({ schema: createIngredientSchema })

        const ingredient = await this.ingredientService.createIngredient(validated)

        response.status(201).json({
            status: "success",
            data: ingredient
        })
    }

    public async update({ request, response }: HttpContextContract) {
        const validated = await request.validate({
            schema: updateIngredientSchema
        })

        const id = request.param("id")

        const ingredient = await this.ingredientService.updateIngredient(id, validated)

        response.status(200).json({
            status: "success",
            data: ingredient
        })
    }

    public async destroy({ request, response }: HttpContextContract) {
        const id = request.param("id")

        await this.ingredientService.deleteIngredient(id)

        response.status(200).json({
            status: "success"
        })
    }
}
