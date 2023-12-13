import { BaseModel, BelongsTo, ManyToMany, beforeCreate, belongsTo, column, computed, manyToMany } from "@ioc:Adonis/Lucid/Orm";
import Ingredient from "./Ingredient";
import generateId from "utils/generate-id";
import Keeper from "./Keeper";

export default class Burger extends BaseModel {
    public static selfAssignPrimaryKey = true;

    @column({ isPrimary: true })
    public id: string

    @column()
    public published: boolean

    @column()
    public name: string

    @manyToMany(() => Ingredient, {
        pivotTable: "burger_ingredients",
        localKey: "id",
        relatedKey: "id",
        pivotForeignKey: "burger_id",
        pivotRelatedForeignKey: "ingredient_id",
        pivotColumns: [
            "amount"
        ]
    })
    public ingredients: ManyToMany<typeof Ingredient>

    @column({ columnName: "keeper_id" })
    public keeperId: string

    @belongsTo(() => Keeper)
    public keeper: BelongsTo<typeof Keeper>

    @computed()
    public get amount() {
        if ("pivot_amount" in this.$extras)
            return this.$extras.pivot_amount
    }

    @beforeCreate()
    public static async beforeCreate(burger: Burger) {
        burger.id = generateId(burger.id, "burger")
    }
}