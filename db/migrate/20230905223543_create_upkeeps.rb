class CreateUpkeeps < ActiveRecord::Migration[7.0]
  def change
    create_table :upkeeps do |t|
      t.string :date, null: false
      t.string :email, null: false
      t.references :city, null: false, foreign_key: true
      t.references :upkeeptipe, null: false, foreign_key: true
      t.references :engine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
