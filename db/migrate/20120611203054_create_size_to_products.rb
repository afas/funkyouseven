class CreateSizeToProducts < ActiveRecord::Migration
  def change
    create_table :size_to_products do |t|
      t.integer :product_id
      t.integer :size_id
      t.integer :product_count
    end
    add_index :size_to_products, :product_id
    add_index :size_to_products, :size_id
    add_index :size_to_products, :product_count
  end
end
