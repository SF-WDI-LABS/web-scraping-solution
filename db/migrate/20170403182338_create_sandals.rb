class CreateSandals < ActiveRecord::Migration[5.0]
  def change
    create_table :sandals do |t|
      t.string :title
      t.string :product_id
      t.integer :price

      t.timestamps
    end
  end
end
