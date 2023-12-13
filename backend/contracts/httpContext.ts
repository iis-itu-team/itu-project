import Keeper from "App/Models/Keeper";

declare module '@ioc:Adonis/Core/HttpContext' {
    interface HttpContextContract {
        keeper?: Keeper
    }
}