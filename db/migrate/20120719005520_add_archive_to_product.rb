class AddArchiveToProduct < ActiveRecord::Migration
  def change
    add_column :products, :archive, :boolean, :default => false
  end
end
