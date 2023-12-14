import FailureException from "App/Exceptions/FailureException"
import Ingredient from "App/Models/Ingredient"

export type CreateIngredientInput = {
    name: string
    price: number
    category: string
}

export type UpdateIngredientInput = {
    name?: string
    price?: number
    category?: string
}

export default class IngredientService {
    public listCategories = async (): Promise<string[]> => {
        const ingredients = await Ingredient.query()
            .select('category')
            .distinct('category')

        return ingredients.map((i) => i.category)
    }

    public listIngredients = async (): Promise<Ingredient[]> => {
        return Ingredient.all();
    }

    public getIngredient = async (id: string): Promise<Ingredient | null> => {
        const ingredient = Ingredient.find(id);

        if (!ingredient) {
            throw FailureException.notFound("ingredient", id)
        }

        return ingredient
    }

    public createIngredient = async (input: CreateIngredientInput): Promise<Ingredient> => {
        return Ingredient.create(input);
    }

    public updateIngredient = async (id: string, input: UpdateIngredientInput): Promise<Ingredient> => {
        const ingredient = await Ingredient.find(id)

        if (!ingredient) {
            throw FailureException.notFound('ingredient', id)
        }

        ingredient?.merge(input)
        return await ingredient.save()
    }

    public deleteIngredient = async (id: string): Promise<void> => {
        const ingredient = await Ingredient.find(id)

        if (!ingredient) {
            throw FailureException.notFound("ingredient", id)
        }

        await ingredient.delete()
    }
}