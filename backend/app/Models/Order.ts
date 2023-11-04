import { column, BaseModel, beforeCreate, manyToMany, ManyToMany, BelongsTo, belongsTo } from "@ioc:Adonis/Lucid/Orm";
import generateId from "utils/generate-id";
import Food from "./Food";
import Keeper from "./Keeper";

export enum DeliveryType {
    HOUSE = "house",
    HOUSE_DOOR = "house_door",
    FLAT_DOOR = "flat_door"
}

export enum PaymentType {
    ON_DELIVERY = "on_delivery",
    CARD = "card",
    PAYPAL = "paypal"
}

export default class Order extends BaseModel {
    public static selfAssignPrimaryKey = true;

    @column({ isPrimary: true })
    public id: string

    @manyToMany(() => Food, {
        pivotTable: "order_foods",
        localKey: "id",
        relatedKey: "id",
        pivotForeignKey: "order_id",
        pivotRelatedForeignKey: "food_id",
        pivotColumns: [
            "amount"
        ]
    })
    public foods: ManyToMany<typeof Food>

    // delivery details

    @column()
    public city: string
    @column()
    public street: string
    @column()
    public houseNumber: string
    @column()
    public deliveryType: DeliveryType
    @column()
    public floor: number
    @column()
    public flatNumber: string
    @column()
    public ring: boolean
    @column()
    public note: string

    // payment

    @column()
    public paymentType: PaymentType

    @belongsTo(() => Keeper)
    public keeper: BelongsTo<typeof Keeper>

    @beforeCreate()
    public static async beforeCreate(order: Order) {
        order.id = generateId(order.id, "order");
    }
}
