import { BaseModel, BelongsTo, HasMany, ManyToMany, beforeCreate, belongsTo, column, computed, hasMany, manyToMany } from "@ioc:Adonis/Lucid/Orm";
import generateId from "utils/generate-id";
import Keeper from "./Keeper";
import BurgerIngredient from "./BurgerIngredients";
import { DateTime } from "luxon";

export default class Burger extends BaseModel {
    public static selfAssignPrimaryKey = true;

    @column({ isPrimary: true })
    public id: string

    @column()
    public published: boolean

    @column()
    public name: string

    @column({ columnName: "keeper_id" })
    public keeperId: string

    @belongsTo(() => Keeper)
    public keeper: BelongsTo<typeof Keeper>

    @hasMany(() => BurgerIngredient)
    public ingredients: HasMany<typeof BurgerIngredient>

    @manyToMany(() => Keeper, {
        pivotTable: "burger_ratings",
        localKey: "id",
        relatedKey: "id",
        pivotForeignKey: "burger_id",
        pivotRelatedForeignKey: "keeper_id",
        pivotColumns: [
            "rating"
        ]
    })
    public ratings: ManyToMany<typeof Keeper>

    @column()
    public icon: string

    @column.dateTime({ autoCreate: true })
    public createdAt: DateTime

    @column.dateTime({ autoCreate: true, autoUpdate: true })
    public updatedAt: DateTime

    @computed()
    public get amount() {
        if ("pivot_amount" in this.$extras)
            return this.$extras.pivot_amount
    }

    @computed()
    public get price() {
        if ("price" in this.$extras)
            return Number(this.$extras.price)
    }

    @computed()
    public get rating() {
        if ("rating" in this.$extras)
            return Number(this.$extras.rating)
        else
            return 0
    }

    // rating by the current user
    // values: 1, -1, 0
    @computed()
    public get currentRating() {
        if ("currentRating" in this.$extras)
            return Number(this.$extras.currentRating);
    }

    @beforeCreate()
    public static async beforeCreate(burger: Burger) {
        burger.id = generateId(burger.id, "burger")
    }
}
