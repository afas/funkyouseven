class AddCoordsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :title_x, :integer, :default => 55
    add_column :products, :title_y, :integer, :default => 285
    add_column :products, :use_background, :boolean, :default => false
  end
end
