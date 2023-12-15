import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class KeeperSilentAuth {
    public async handle(ctx: HttpContextContract, next: () => Promise<void>) {
        if (!ctx.keeper) {
            ctx.response.status(401).json({
                status: "unauthorized",
            })
            return
        }
        await next()
    }
}
