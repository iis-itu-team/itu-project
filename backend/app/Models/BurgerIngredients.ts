import { BaseModel, column, computed } from "@ioc:Adonis/Lucid/Orm";
import { DateTime } from "luxon";

export default class BurgerIngredient extends BaseModel {
    public static selfAssignPrimaryKey = true;

    @column({ serializeAs: null })
    public burgerId: string

    @column({ columnName: 'ingredient_id' })
    public id: string

    @column()
    public amount: number

    @column()
    public index: number

    @column.dateTime({ autoCreate: true })
    public createdAt: DateTime

    @column.dateTime({ autoCreate: true, autoUpdate: true })
    public updatedAt: DateTime

    // -- merge in Ingredient props from extras

    @computed()
    public get price() {
        if ("price" in this.$extras) {
            return this.$extras.price
        }
    }

    @computed()
    public get name() {
        if ("name" in this.$extras) {
            return this.$extras.name
        }
    }

    @computed()
    public get category() {
        if ("category" in this.$extras) {
            return this.$extras.category
        }
    }
}