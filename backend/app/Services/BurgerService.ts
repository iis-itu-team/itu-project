import FailureException from "App/Exceptions/FailureException";
import Burger from "App/Models/Burger"
import Ingredient from "App/Models/Ingredient";
import Keeper from "App/Models/Keeper";

export type ListBurgersInput = {
    published: boolean | null
    keeperId?: string
}

export type IngredientInput = {
    id: string
    amount: number
}

export type CreateBurgerInput = {
    publish: boolean
    name: string
    ingredients: IngredientInput[]
}

export default class BurgerService {
    public listBurgers = async (input: ListBurgersInput): Promise<Burger[]> => {
        const q = Burger.query()
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

    public getBurger = async (id: string): Promise<Burger> => {
        const burger = await Burger.query()
            .where("id", id)
            .preload("ingredients", (query) => {
                query.pivotColumns(["amount"])
            })
            .first();

        if (!burger) {
            throw FailureException.notFound("burger", id)
        }

        return burger
    }

    public createBurger = async (keeper: Keeper, input: CreateBurgerInput): Promise<Burger> => {
        await Promise.all(input.ingredients.map(async (ingredient: IngredientInput) => {
            const ingredientModel = await Ingredient.find(ingredient.id)

            if (!ingredientModel) {
                throw FailureException.notFound("ingredient", ingredient.id)
            }

            return ingredientModel
        }))

        let burger = await Burger.create({
            name: input.name,
            published: input.publish
        })

        await burger.related("keeper").associate(keeper)

        await Promise.all(input.ingredients.map(async (ingredient: IngredientInput) => {
            await burger.related("ingredients").attach({
                [ingredient.id]: {
                    amount: ingredient.amount
                }
            })
        }))

        burger = await burger.refresh()
        await burger.load("ingredients", (query) => {
            query.pivotColumns(["amount"])
        })

        return burger
    }

    public deleteBurger = async (id: string) => {
        const burger = await Burger.find(id)

        if (!burger) {
            throw FailureException.notFound("burger", id)
        }

        await burger.delete()
    }
}