import Database from "@ioc:Adonis/Lucid/Database";
import FailureException from "App/Exceptions/FailureException";
import Burger from "App/Models/Burger"
import Ingredient from "App/Models/Ingredient";
import Keeper from "App/Models/Keeper";
import Application from '@ioc:Adonis/Core/Application'
import mergeImages from 'merge-images'
import { Canvas, Image } from 'canvas'
import fs from "fs/promises"

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
        q.select(Database.from('burger_ingredients')
            .whereRaw('burger_ingredients.burger_id = burgers.id')
            .join('ingredients', 'burger_ingredients.ingredient_id', 'ingredients.id')
            .groupBy('burger_id')
            .select(Database.raw('sum(ingredients.price * burger_ingredients.amount) as total_price'))
            .as('price')
        )
    }

    private fetchRating(q, keeperId?: string) {
        q.select(Database.from('burger_ratings')
            .whereRaw('burgers.id = burger_ratings.burger_id')
            .groupBy('burger_ratings.burger_id')
            .sum('rating')
            .as('rating'),
        )

        if (keeperId) {
            q.select(Database.from('burger_ratings')
                .whereRaw('burgers.id = burger_ratings.burger_id')
                .andWhereRaw(`'${keeperId}' = burger_ratings.keeper_id`)
                .select(Database.raw('CASE WHEN rating IS NULL THEN 0 ELSE rating END as c_rating'))
                .as('currentRating'))
        }
    }

    public listBurgers = async (input: ListBurgersInput, currentKeeperId?: string): Promise<Burger[]> => {
        const q = Burger.query()
            .select('*')
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

        this.fetchRating(q, currentKeeperId)

        return await q
    }

    public getBurger = async (id: string, keeperId: string): Promise<Burger> => {
        const q = Burger.query()
            .select('*')
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
            .select('*')
            .where('id', burger.id)
            .preload('ingredients', (q) => {
                q.leftJoin('ingredients', 'ingredients.id', 'burger_ingredients.ingredient_id')
            })

        this.calculatePrice(q)

        this.fetchRating(q, keeper.id)

        const res = await q.first()

        if (!res) {
            throw new FailureException(500, "failed_to_create", "Failed to create burger, not found in psot query.");
        }

        const icon = await this.createBurgerIcon(res)

        if (icon) {
            res.icon = icon;
            await res.save()
        }

        return res
    }

    public updateBurger = async (id: string, input: UpdateBurgerInput, currentKeeperId?: string) => {
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
            .select('*')
            .where('id', burger.id)
            .preload('ingredients', (q) => {
                q.leftJoin('ingredients', 'ingredients.id', 'burger_ingredients.ingredient_id')
            })

        this.calculatePrice(q)

        this.fetchRating(q, currentKeeperId)

        const res = await q.first()

        if (!res) {
            throw new FailureException(500, "failed_to_create", "Failed to create burger, not found in psot query.");
        }

        // same path, no need to update
        const icon = await this.createBurgerIcon(res)

        if (!res.icon && icon) {
            res.icon = icon
            await res.save()
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
            .select('*')
            .where('id', burger.id)
            .preload('ingredients', (q) => {
                q.leftJoin('ingredients', 'ingredients.id', 'burger_ingredients.ingredient_id')
            })

        this.calculatePrice(q)

        this.fetchRating(q, keeperId)

        return await q.first()
    }

    public deleteBurger = async (id: string) => {
        const burger = await Burger.find(id)

        if (!burger) {
            throw FailureException.notFound("burger", id)
        }

        await burger.delete()

        if (burger.icon) {
            await fs.unlink(Application.makePath('public', burger.icon))
        }
    }

    // create burger icon from ingredients
    // icon path: /icons/burgers/<id>.png
    private async createBurgerIcon(burger: Burger) {
        const relPath = `/icons/burgers/${burger.id}.png`

        // find existing icon, if any, saved by id
        const icon: string = Application.makePath('public', relPath)

        // get icons for ingredients

        const offset = 50;

        let y = 100;

        // place items from bottom, y at the end is the final height
        // move all items down by final height

        const images: any[] = []
        burger.ingredients.sort((a, b) => {
            return a.index > b.index ? -1 : 1
        }).forEach((ingredient, idx) => {

            let iconPath: string | null = null;
            if (idx == 0) {
                iconPath = Application.makePath('public/icons/ingredients/bottom_bun.png')
            } else if (idx == burger.ingredients.length - 1) {
                iconPath = Application.makePath('public/icons/ingredients/top_bun.png')
            } else {
                if (ingredient.icon == null) {
                    return
                } else {
                    iconPath = Application.makePath('public', ingredient.icon)
                }
            }

            if (idx != 0) {
                if (ingredient.category == 'cheese') {
                    y += 0
                } else {
                    y += offset
                }
            }

            images.push({
                src: iconPath,
                y,
                x: 0
            })
        })

        images.forEach((image) => {
            image.y = y - image.y
        })

        const b64 = await mergeImages(images, {
            Canvas,
            Image,
            height: y,
            width: 400
        })

        let m = b64.match(/^data:([A-Za-z-+\/]+);base64,(.+)$/);

        const res = await fs.writeFile(icon, Buffer.from(m[2], 'base64'))

        if (res === undefined) {
            Application.logger.info('Image generated for burger ' + burger.name + ' into ' + icon)
            return relPath
        } else {
            Application.logger.error('Failed to generate imaged for ' + burger.id)
            return null
        }
    }
}
