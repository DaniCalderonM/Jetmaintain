class CreateJoinTableMaterialsUpkeeps < ActiveRecord::Migration[7.0]
  def change
    create_join_table :materials, :upkeeps do |t|
      # t.index [:material_id, :upkeep_id]
      # t.index [:upkeep_id, :material_id]
    end
  end
end
