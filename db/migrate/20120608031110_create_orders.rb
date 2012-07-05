class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :address, :null => false
      t.text :comment
      t.text :internal_comment
      t.integer :order_status_id, :default => 0
      t.integer :pay_status_id
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps

      t.timestamps
    end

    add_index :orders, :user_id
    add_index :orders, :order_status_id
    add_index :orders, :pay_status_id

  end
end
