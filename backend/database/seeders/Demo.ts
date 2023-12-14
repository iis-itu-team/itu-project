import Database from '@ioc:Adonis/Lucid/Database'
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

    const bun = ingredients.find((i) => i.category == 'bun');
    const meat = ingredients.find((i) => i.category == 'meat');
    const salad = ingredients.find((i) => i.category == 'salad');
    const sauce = ingredients.find((i) => i.category == 'sauce');

    const relations = [
      {
        ingredient_id: bun!.id,
        amount: 1,
        index: 0
      },
      {
        ingredient_id: sauce!.id,
        amount: 1,
        index: 1
      },
      {
        ingredient_id: meat!.id,
        amount: 1,
        index: 2
      },
      {
        ingredient_id: salad!.id,
        amount: 1,
        index: 3
      },
      {
        ingredient_id: bun!.id,
        amount: 1,
        index: 4
      }
    ];

    await Database.table('burger_ingredients').multiInsert(relations.map((r) => {
      return {
        ...r,
        burger_id: burger.id
      };
    }))
  }
}
