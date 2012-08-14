class AddLookToProduct < ActiveRecord::Migration
  def change
    add_column :products, :look, :boolean, :default => false
    add_column :products, :discount, :integer
  end
end
