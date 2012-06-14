class CreateSizeToProducts < ActiveRecord::Migration
  def change
    create_table :size_to_products do |t|
      t.integer :product_id
      t.integer :size_id

      t.timestamps
    end
  end
end
