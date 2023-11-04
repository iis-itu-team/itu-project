import FailureException from "App/Exceptions/FailureException"
import Food from "App/Models/Food"
import Keeper from "App/Models/Keeper"
import Order, { DeliveryType, PaymentType } from "App/Models/Order"

export type ListOrdersInput = {
    keeperId?: string
}

export type FoodInput = {
    id: string
    amount: number
}

export type CreateOrderInput = {
    foods: FoodInput[],

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

        return await q
    }

    public getOrder = async (id: string) => {
        const order = await Order.find(id)

        if (!order) {
            throw FailureException.notFound("order", id)
        }

        return order
    }

    public createOrder = async (keeper: Keeper, input: CreateOrderInput) => {

        // todo: don't associate existing foods, create new ones with same ingredients
        // we want to avoid users changing already ordered foods - aka changing the past

        await Promise.all(input.foods.map(async (food: FoodInput) => {
            const foodModel = await Food.find(food.id)

            if (!foodModel) {
                throw FailureException.notFound("food", food.id)
            }
        }))

        const order = await Order.create({
            ...input
        })

        await order.related("keeper").associate(keeper)

        return order
    }
}