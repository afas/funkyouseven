class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :address, :null => false
      t.text :comment
      t.integer :order_status, :default => 0
      t.integer :pay_status

      t.timestamps
    end

    add_index :orders, :user_id
    add_index :orders, :order_status
    add_index :orders, :pay_status

  end
end
