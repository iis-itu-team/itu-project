import { BaseModel, column, computed } from "@ioc:Adonis/Lucid/Orm";

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