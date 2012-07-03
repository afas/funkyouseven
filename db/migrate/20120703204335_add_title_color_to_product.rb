class AddTitleColorToProduct < ActiveRecord::Migration
  def change
    add_column :products, :title_color, :string, :default => "black"
  end
end
