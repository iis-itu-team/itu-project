import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class extends BaseSchema {
  public async up() {
    this.schema.renameTable('foods', 'burgers')
    this.schema.renameTable('order_foods', 'order_burgers')
    this.schema.renameTable('food_ingredients', 'burger_ingredients')

    this.schema.table('burger_ingredients', (table) => {
      table.renameColumn('food_id', 'burger_id')
    })

    this.schema.table('order_burgers', (table) => {
      table.renameColumn('food_id', 'burger_id')
    })
  }

  public async down() {
    this.schema.renameTable('burgers', 'foods')
    this.schema.renameTable('order_burgers', 'order_foods')
    this.schema.renameTable('burger_ingredients', 'food_ingredients')

    this.schema.table('burger_ingredients', (table) => {
      table.renameColumn('burger_id', 'food_id')
    })

    this.schema.table('order_burgers', (table) => {
      table.renameColumn('burger_id', 'food_id')
    })
  }
}
