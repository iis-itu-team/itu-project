import BaseSchema from '@ioc:Adonis/Lucid/Schema'
import { DeliveryType, PaymentType } from 'App/Models/Order'

export default class extends BaseSchema {
  protected tableName = 'orders'

  public async up () {
    this.schema.createTable(this.tableName, (table) => {
      table.string('id').primary()

      table.string("city")
      table.string("street")
      table.string("house_number")
      table.enum("delivery_type", Object.values(DeliveryType))
      table.integer("floor").nullable()
      table.string("flat_number").nullable()
      table.boolean("ring")
      table.string("note").nullable()
      table.enum("payment_type", Object.values(PaymentType))

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
