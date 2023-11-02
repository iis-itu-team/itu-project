import { BaseModel, ManyToMany, beforeCreate, column, manyToMany } from "@ioc:Adonis/Lucid/Orm";
import Ingredient from "./Ingredient";
import generateId from "utils/generate-id";

export default class Food extends BaseModel {
    public static selfAssignPrimaryKey = true;

    @column({ isPrimary: true })
    public id: string

    @column()
    public published: boolean

    @column()
    public name: string

    @manyToMany(() => Ingredient, {
        pivotTable: "food_ingredients",
        localKey: "id",
        relatedKey: "id",
        pivotForeignKey: "food_id",
        pivotRelatedForeignKey: "ingredient_id",
        pivotColumns: [
            "amount"
        ]
    })
    public ingredients: ManyToMany<typeof Ingredient>

    @beforeCreate()
    public static beforeCreate(food: Food) {
        food.id = generateId(food.id, "food")
    }
}