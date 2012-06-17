class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id, :null => false
      t.integer :product_id, :null => false
      t.integer :product_count, :null => false
      t.integer :product_size
    end
  end
end
