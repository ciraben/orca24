class CreateButtons < ActiveRecord::Migration[7.2]
  def change
    create_table :buttons do |t|
      t.string :label

      t.timestamps
    end
  end
end
