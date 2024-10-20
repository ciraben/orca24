class CreateButtons < ActiveRecord::Migration[7.2]
  def change
    create_table :buttons do |t|
      t.string :label
      t.references :location
      t.references :destination

      t.timestamps
    end
    
    add_foreign_key :buttons, :rooms, column: :location_id, primary_key: :id
    add_foreign_key :buttons, :rooms, column: :destination_id, primary_key: :id
  end
end
