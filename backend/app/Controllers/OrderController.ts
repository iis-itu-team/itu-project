import { HttpContextContract } from "@ioc:Adonis/Core/HttpContext";
import OrderService from "App/Services/OrderService";
import { schema, rules } from "@ioc:Adonis/Core/Validator";
import { DeliveryType, PaymentType } from "App/Models/Order";
import KeeperService from "App/Services/KeeperService";
import FailureException from "App/Exceptions/FailureException";

const createOrderSchema = schema.create({
    foods: schema.array().members(schema.object().members({
        id: schema.string(),
        amount: schema.number([
            rules.unsigned()
        ])
    })),

    city: schema.string(),
    street: schema.string(),
    houseNumber: schema.string(),

    deliveryType: schema.enum(Object.values(DeliveryType)),
    floor: schema.number.optional([
        rules.requiredWhen("deliveryType", "=", "flat_door")
    ]),
    flatNumber: schema.string.optional([
        rules.requiredWhen("deliveryType", "=", "flat_door")
    ]),

    ring: schema.boolean(),
    note: schema.string.optional(),

    paymentType: schema.enum(Object.values(PaymentType)),

    keeperId: schema.string()
})

export default class OrderController {
    private readonly orderService = new OrderService()
    private readonly keeperService = new KeeperService()

    public async index({ response }: HttpContextContract) {
        const orders = await this.orderService.listOrders()

        response.status(200).json({
            status: "success",
            data: orders,
            count: orders.length
        })
    }

    public async show({ request, response }: HttpContextContract) {
        const id = request.param("id")

        const order = await this.orderService.getOrder(id)

        response.status(200).json({
            status: "success",
            data: order
        })
    }

    public async store({ request, response }: HttpContextContract) {
        const validated = await request.validate({
            schema: createOrderSchema
        })

        const keeper = await this.keeperService.getKeeper(validated.keeperId)

        if (!keeper) {
            throw FailureException.notFound("keeper", validated.keeperId)
        }

        const order = await this.orderService.createOrder(keeper, validated)

        response.status(201).json({
            status: "success",
            data: order
        })
    }
}