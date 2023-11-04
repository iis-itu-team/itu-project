import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class extends BaseSchema {
  protected tableName = 'foods'

  public async up() {
    this.schema.alterTable(this.tableName, (table) => {
      table.string("keeper_id").after("published").references("keepers.id")
    })
  }

  public async down() {
    this.schema.alterTable(this.tableName, (table) => {
      table.dropColumn("keeper_id")
    })
  }
}
