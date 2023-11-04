import { BaseModel, beforeCreate, column } from "@ioc:Adonis/Lucid/Orm";
import generateId from "utils/generate-id";

export default class Keeper extends BaseModel {
    public static selfAssignPrimaryKey = true

    @column({ isPrimary: true })
    public id: string

    @beforeCreate()
    public static async beforeCreate(keeper: Keeper) {
        keeper.id = generateId(keeper.id, "keeper")
    }
}
