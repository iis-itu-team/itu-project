import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import KeeperService from 'App/Services/KeeperService'

export default class KeeperController {
    private readonly keeperService = new KeeperService()

    public async store({ response }: HttpContextContract) {
        const keeper = await this.keeperService.createKeeper()

        response.status(201).json({
            status: "success",
            data: keeper.id
        })
    }

    public async exists({ request, response }: HttpContextContract) {
        const id = request.param("id")

        const keeper = await this.keeperService.getKeeper(id)

        response.status(200).json({
            status: keeper != null ? "exists" : "does_not_exist"
        })
    }
}
