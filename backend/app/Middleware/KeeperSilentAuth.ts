import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Keeper from 'App/Models/Keeper'

export default class KeeperSilentAuth {
    public async handle(ctx: HttpContextContract, next: () => Promise<void>) {

        const keeperId = ctx.request.header('Keeper-ID')

        if (!keeperId) {
            await next()
            return
        }

        const keeper = await Keeper.find(keeperId)

        if (!keeper) {
            ctx.response.status(404).json({
                status: "invalid_keeper_id"
            })
            return
        }

        ctx.keeper = keeper;
        await next()
    }
}
