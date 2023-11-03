import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { safeEqual } from '@ioc:Adonis/Core/Helpers'
import Env from '@ioc:Adonis/Core/Env'

export default class RequireApiKey {
  public async handle({ request, response }: HttpContextContract, next: () => Promise<void>) {

    const key = request.header('API-Key')

    if (!key) {
      response.status(401).json({
        status: "missing_api_key",
        error: {
          message: "Missing API key."
        }
      })
      return
    }

    if (!safeEqual(key, Env.get("API_KEY"))) {
      response.status(401).json({
        status: "invalid_api_key",
        error: {
          message: "Invalid API key."
        }
      })
      return
    }

    await next()
  }
}
