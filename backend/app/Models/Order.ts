import { column, BaseModel, beforeCreate, manyToMany, ManyToMany, BelongsTo, belongsTo, computed } from "@ioc:Adonis/Lucid/Orm";
import generateId from "utils/generate-id";
import Burger from "./Burger";
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

    @manyToMany(() => Burger, {
        pivotTable: "order_burgers",
        localKey: "id",
        relatedKey: "id",
        pivotForeignKey: "order_id",
        pivotRelatedForeignKey: "burger_id",
        pivotColumns: [
            "amount"
        ]
    })
    public burgers: ManyToMany<typeof Burger>

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

    @column({ columnName: "keeper_id" })
    public keeperId: string

    @belongsTo(() => Keeper)
    public keeper: BelongsTo<typeof Keeper>

    @computed()
    public get price() {
        if ("order_price" in this.$extras)
            return Number(this.$extras.order_price)
    }

    @beforeCreate()
    public static async beforeCreate(order: Order) {
        order.id = generateId(order.id, "order");
    }
}
