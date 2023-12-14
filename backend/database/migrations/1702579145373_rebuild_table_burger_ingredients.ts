import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class extends BaseSchema {
  protected tableName = 'burger_ingredients'

  public async up() {
    this.schema.dropTable(this.tableName)

    this.schema.createTable(this.tableName, (table) => {
      table.integer('index')

      table.string("burger_id").references("burgers.id").onDelete("cascade")
      table.string("ingredient_id").references("ingredients.id").onDelete("set null")
      table.unique(['burger_id', 'ingredient_id', 'index'])

      table.integer("amount").unsigned().defaultTo(1)

      /**
       * Uses timestamptz for PostgreSQL and DATETIME2 for MSSQL
       */
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down() {
    // no way back, too many changes
    this.schema.dropTable(this.tableName)
  }
}
