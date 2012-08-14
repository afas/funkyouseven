class CreateProductToLooks < ActiveRecord::Migration
  def change
    create_table :product_to_looks do |t|
      t.integer :product_id
      t.integer :look_id
    end

    add_index :product_to_looks, :product_id
    add_index :product_to_looks, :look_id

  end
end
