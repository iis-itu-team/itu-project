import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class extends BaseSchema {
  protected tableName = 'orders'
  
  public async up() {
    this.schema.alterTable(this.tableName, (table) => {
      table.string("keeper_id").after("payment_type").references("keepers.id")
    })
  }

  public async down() {
    this.schema.alterTable(this.tableName, (table) => {
      table.dropColumn("keeper_id")
    })
  }
}
