class CreateEngines < ActiveRecord::Migration[7.0]
  def change
    create_table :engines do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.references :feature, null: false, foreign_key: true

      t.timestamps
    end
  end
end
