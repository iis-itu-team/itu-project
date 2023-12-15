import Database from "@ioc:Adonis/Lucid/Database"
import FailureException from "App/Exceptions/FailureException"
import Burger from "App/Models/Burger"
import Keeper from "App/Models/Keeper"
import Order, { DeliveryType, PaymentType } from "App/Models/Order"

export type ListOrdersInput = {
    keeperId?: string
}

export type BurgerInput = {
    id: string
    amount: number
}

export type CreateOrderInput = {
    burgers: BurgerInput[],

    city: string
    postalCode: string
    street: string
    houseNumber: string
    deliveryType: DeliveryType
    floor?: number
    flatNumber?: string
    ring: boolean
    note?: string

    paymentType: PaymentType
}

export default class OrderService {
    private calculatePrice(q) {
        q.select('*', Database.from((subq) => {
            subq.from('burger_ingredients')
                /* .whereRaw('burger_ingredients.burger_id = burgers.id') */
                .join('ingredients', 'burger_ingredients.ingredient_id', 'ingredients.id')
                .groupBy('burger_id')
                .select('burger_id', Database.raw('sum(ingredients.price * burger_ingredients.amount) as burger_price'))
                .as('burger_prices')
        })
            .rightJoin('order_burgers', 'order_burgers.burger_id', 'burger_prices.burger_id')
            .groupBy('order_burgers.order_id')
            .whereRaw('orders.id = order_burgers.order_id')
            .select(Database.raw('sum(order_burgers.amount * burger_prices.burger_price) as order_price'))
            .as('order_price'))
    }

    public listOrders = async (input: ListOrdersInput) => {
        const q = Order.query()
            .preload('burgers')

        if (input.keeperId) {
            q.andWhere("keeper_id", input.keeperId)
        }

        this.calculatePrice(q);

        return await q
    }

    public getOrder = async (id: string) => {
        const q = Order.query()
            .where('id', id)
            .preload('burgers')

        this.calculatePrice(q)

        const order = await q.first()

        if (!order) {
            throw FailureException.notFound("order", id)
        }


        return order
    }

    public createOrder = async (keeper: Keeper, input: CreateOrderInput) => {

        // todo: don't associate existing foods, create new ones with same ingredients
        // we want to avoid users changing already ordered foods - aka changing the past

        await Promise.all(input.burgers.map(async (burger: BurgerInput) => {
            const burgerModel = await Burger.find(burger.id)

            if (!burgerModel) {
                throw FailureException.notFound("burger", burger.id)
            }
        }))

        const order = await Order.create({
            ...input
        })

        await order.related("keeper").associate(keeper)

        const relations = {};
        input.burgers.forEach((b) => {
            relations[b.id] = { amount: b.amount };
        })

        await order.related('burgers').attach(relations)

        const q = Order.query()
            .where('id', order.id)
            .preload('burgers')

        this.calculatePrice(q)

        return await q.first()
    }
}