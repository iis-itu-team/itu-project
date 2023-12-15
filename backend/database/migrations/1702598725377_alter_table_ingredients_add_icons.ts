import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class extends BaseSchema {
  protected tableName = 'ingredients'

  public async up () {
    this.schema.alterTable(this.tableName, (table) => {
      table.string('icon')
    })
  }

  public async down () {
    this.schema.alterTable(this.tableName, (table) => {
      table.dropColumn('icon')
    })
  }
}
