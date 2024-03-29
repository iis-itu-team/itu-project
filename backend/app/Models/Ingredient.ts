import { BaseModel, beforeCreate, column, computed } from "@ioc:Adonis/Lucid/Orm";
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

    @column()
    public category: string;

    // path relative to /public/
    @column()
    public icon: string;

    @column.dateTime({ autoCreate: true })
    public createdAt: DateTime

    @column.dateTime({ autoCreate: true, autoUpdate: true })
    public updatedAt: DateTime

    // load amount from extras if possible
    @computed()
    public get amount() {
        if ("pivot_amount" in this.$extras)
            return this.$extras.pivot_amount;
    }

    @computed()
    public get index() {
        if ("pivot_index" in this.$extras)
            return this.$extras.pivot_index;
    }

    @beforeCreate()
    public static async assignId(ingredient: Ingredient) {
        ingredient.id = generateId(ingredient.id, "ingr");
    }
}
