import { BaseModel, beforeCreate, column } from "@ioc:Adonis/Lucid/Orm";
import { DateTime } from "luxon";
import generateId from "utils/generate-id";

export default class Ingredient extends BaseModel {
    public static selfAssignPrimaryKey = true;

    @column({ isPrimary: true })
    public id: string;

    @column()
    public name: string;

    @column()
    public price: number;

    @column.dateTime({ autoCreate: true })
    public createdAt: DateTime

    @column.dateTime({ autoCreate: true, autoUpdate: true })
    public updatedAt: DateTime

    @beforeCreate()
    public static async assignId(ingredient: Ingredient) {
        ingredient.id = generateId(ingredient.id, "ingr");
    }
}
