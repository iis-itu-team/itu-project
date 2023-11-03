import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class extends BaseSchema {
  protected tableName = 'order_foods'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.string("order_id").references("orders.id").onDelete("cascade")
      table.string("food_id").references("foods.id").onDelete("set null")

      table.unique(["order_id", "food_id"])

      table.integer("amount").unsigned()

      /**
       * Uses timestamptz for PostgreSQL and DATETIME2 for MSSQL
       */
      table.timestamp('created_at', { useTz: true })
      table.timestamp('updated_at', { useTz: true })
    })
  }

  public async down () {
    this.schema.dropTable(this.tableName)
  }
}
