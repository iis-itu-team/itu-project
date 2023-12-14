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
        price: 100,
        category: "meat"
      },
      {
        name: "Houska",
        price: 10,
        category: "bun"
      },
      {
        name: "Salát",
        price: 20,
        category: "salad"
      },
      {
        name: "Hořčice",
        price: 5,
        category: "sauce"
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
