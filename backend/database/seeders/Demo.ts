import BaseSeeder from '@ioc:Adonis/Lucid/Seeder'
import Burger from 'App/Models/Burger'
import Ingredient from 'App/Models/Ingredient'
import Keeper from 'App/Models/Keeper'

export default class extends BaseSeeder {
  public async run() {
    // create a keeper
    const keeper = await Keeper.create({})

    // fill in some basic ingredients
    const ingredients = await Ingredient.createMany([
      {
        name: "Maso",
        price: 100
      },
      {
        name: "Houska",
        price: 10
      },
      {
        name: "Salát",
        price: 20
      },
      {
        name: "Hořčice",
        price: 5
      }
    ])

    const burger = await Burger.create({
      name: "Nejvíc burgr",
      keeperId: keeper.id
    })

    const relations = {};
    ingredients.forEach((i) => {
      relations[i.id] = {
        amount: 1
      }
    })

    await burger.related('ingredients').attach(relations)
  }
}
