/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| This file is dedicated for defining HTTP routes. A single file is enough
| for majority of projects, however you can define routes in different
| files and just make sure to import them inside this file. For example
|
| Define routes in following two files
| ├── start/routes/cart.ts
| ├── start/routes/customer.ts
|
| and then import them inside `start/routes.ts` as follows
|
| import './routes/cart'
| import './routes/customer'
|
*/

import Route from '@ioc:Adonis/Core/Route'

Route.group(() => {
  Route.get('/', async () => {
    return {
      status: "alive"
    }
  })

  Route.group(() => {
    Route.post("/", "KeeperController.store")
    Route.get("/:id/exists", "KeeperController.exists")
  }).prefix("keepers")

  Route.resource("ingredients", "IngredientController")
    .only(["index", "show", "store", "update", "destroy"])

  Route.resource("burgers", "BurgerController")
    .only(["index", "show", "store", "destroy"])

  Route.resource("orders", "OrderController")
    .only(["index", "show", "store"])
}).prefix('api').middleware("requireApiKey")
