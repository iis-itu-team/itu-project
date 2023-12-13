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
    public listOrders = async (input: ListOrdersInput) => {
        const q = Order.query()

        if (input.keeperId) {
            q.andWhere("keeper_id", input.keeperId)
        }

        q.preload('burgers')

        return await q
    }

    public getOrder = async (id: string) => {
        const order = await Order.query()
            .where('id', id)
            .preload('burgers')
            .first()

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

        return order
    }
}