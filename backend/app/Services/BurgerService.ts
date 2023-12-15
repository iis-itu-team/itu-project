import Database from "@ioc:Adonis/Lucid/Database";
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
    index: number
}

export type CreateBurgerInput = {
    name: string
    published: boolean
    ingredients: IngredientInput[]
}

export type UpdateBurgerInput = {
    name?: string
    published?: boolean
    ingredients?: IngredientInput[]
}

export default class BurgerService {
    private calculatePrice(q) {
        q.select('*', Database.from('burger_ingredients')
            .whereRaw('burger_ingredients.burger_id = burgers.id')
            .join('ingredients', 'burger_ingredients.ingredient_id', 'ingredients.id')
            .groupBy('burger_id')
            .select(Database.raw('sum(ingredients.price * burger_ingredients.amount) as total_price'))
            .as('price')
        )
    }

    private fetchRating(q, keeperId: string) {
        q.select('*', Database.from('burger_ratings')
            .whereRaw('burgers.id = burger_ratings.burger_id')
            .groupBy('burger_ratings.burger_id')
            /* .select(Database.raw('(CASE WHEN rating IS NULL THEN 0 ELSE rating END) as r_rating')) */
            .sum('rating')
            .as('rating'))

        q.select('*', Database.from('burger_ratings')
            .whereRaw('burgers.id = burger_ratings.burger_id')
            .andWhereRaw(keeperId + ' = burger_ratings.keeper_id')
            .as('currentRating'))
    }

    public listBurgers = async (input: ListBurgersInput): Promise<Burger[]> => {
        const q = Burger.query()
            .preload('ingredients', (q) => {
                q.leftJoin('ingredients', 'ingredients.id', 'burger_ingredients.ingredient_id')
            })

        if (input.keeperId) {
            q.andWhere("keeper_id", input.keeperId)
        }

        if (input.published != null) {
            q.andWhere("published", input.published)
        }

        // calculate price from ingredients
        this.calculatePrice(q)

        this.fetchRating(q, input.keeperId ?? '')

        return await q
    }

    public getBurger = async (id: string, keeperId: string): Promise<Burger> => {
        const q = Burger.query()
            .where("id", id)
            .preload('ingredients', (q) => {
                q.leftJoin('ingredients', 'ingredients.id', 'burger_ingredients.ingredient_id')
            })

        // calculate price from ingredients
        this.calculatePrice(q)

        this.fetchRating(q, keeperId)

        const burger = await q.first()

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
            published: input.published
        })

        await burger.related("keeper").associate(keeper)

        // -- manually insert all the ingredient relations

        await Database.table('burger_ingredients')
            .multiInsert(input.ingredients.map((ingredient) => {
                return {
                    burger_id: burger.id,
                    ingredient_id: ingredient.id,
                    amount: ingredient.amount,
                    index: ingredient.index
                }
            }))

        const q = Burger.query()
            .where('id', burger.id)
            .preload('ingredients', (q) => {
                q.leftJoin('ingredients', 'ingredients.id', 'burger_ingredients.ingredient_id')
            })

        this.calculatePrice(q);

        const res = await q.first()

        if (!res) {
            throw new FailureException(500, "failed_to_create", "Failed to create burger, not found in psot query.");
        }

        return res
    }

    public updateBurger = async (id: string, input: UpdateBurgerInput) => {
        let burger = await Burger.query()
            .where('id', id)
            .preload('ingredients')
            .first()

        if (!burger) {
            throw FailureException.notFound("burger", id)
        }

        // -- update basic properties (name, published)

        burger.merge(input)
        burger = await burger.save()

        if (input.ingredients) {
            // -- update ingredients
            // - delete all relations and them set them again, nothing extra

            await Database.from('burger_ingredients').where('burger_id', id).delete()

            await Database.table('burger_ingredients')
                .multiInsert(input.ingredients?.map((ingredient) => {
                    return {
                        burger_id: burger!.id,
                        ingredient_id: ingredient.id,
                        amount: ingredient.amount,
                        index: ingredient.index
                    }
                }))
        }

        const q = Burger.query()
            .where('id', burger.id)
            .preload('ingredients', (q) => {
                q.leftJoin('ingredients', 'ingredients.id', 'burger_ingredients.ingredient_id')
            })

        this.calculatePrice(q);

        const res = await q.first()

        if (!res) {
            throw new FailureException(500, "failed_to_create", "Failed to create burger, not found in psot query.");
        }

        return res
    }

    public rateBurger = async (id: string, keeperId: string, newRating: number) => {
        const burger = await Burger.find(id)

        if (!burger) {
            throw FailureException.notFound("burger", id)
        }

        const keeper = await Keeper.find(keeperId)

        if (!keeper) {
            throw FailureException.notFound("keeper", keeperId)
        }

        await burger.related('ratings').save(keeper, true, {
            rating: newRating
        })

        const q = Burger.query()

        this.fetchRating(q, keeperId)

        return await q.first()
    }

    public deleteBurger = async (id: string) => {
        const burger = await Burger.find(id)

        if (!burger) {
            throw FailureException.notFound("burger", id)
        }

        await burger.delete()
    }
}
