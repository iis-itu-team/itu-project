import FailureException from "App/Exceptions/FailureException";
import Food from "App/Models/Food"
import Ingredient from "App/Models/Ingredient";
import Keeper from "App/Models/Keeper";

export type ListFoodsInput = {
    published: boolean|null
    keeperId?: string
}

export type IngredientInput = {
    id: string
    amount: number
}

export type CreateFoodInput = {
    publish: boolean
    name: string
    ingredients: IngredientInput[]
}

export default class FoodService {
    public listFoods = async (input: ListFoodsInput): Promise<Food[]> => {
        const q = Food.query()
            .preload("ingredients", (query) => {
                query.pivotColumns(["amount"])
            });

        if (input.keeperId) {
            q.andWhere("keeper_id", input.keeperId)
        }

        if (input.published != null) {
            q.andWhere("published", input.published)
        }

        return await q
    }

    public getFood = async (id: string): Promise<Food> => {
        const food = await Food.query()
            .where("id", id)
            .preload("ingredients", (query) => {
                query.pivotColumns(["amount"])
            })
            .first();

        if (!food) {
            throw FailureException.notFound("food", id)
        }

        return food
    }

    public createFood = async (keeper: Keeper, input: CreateFoodInput): Promise<Food> => {
        await Promise.all(input.ingredients.map(async (ingredient: IngredientInput) => {
            const ingredientModel = await Ingredient.find(ingredient.id)

            if (!ingredientModel) {
                throw FailureException.notFound("ingredient", ingredient.id)
            }

            return ingredientModel
        }))

        let food = await Food.create({
            name: input.name,
            published: input.publish
        })

        await food.related("keeper").associate(keeper)

        await Promise.all(input.ingredients.map(async (ingredient: IngredientInput) => {
            await food.related("ingredients").attach({
                [ingredient.id]: {
                    amount: ingredient.amount
                }
            })
        }))

        food = await food.refresh()
        await food.load("ingredients", (query) => {
            query.pivotColumns(["amount"])
        })

        return food
    }

    public deleteFood = async (id: string) => {
        const food = await Food.find(id)

        if (!food) {
            throw FailureException.notFound("food", id)
        }

        await food.delete()
    }
}