class DeleteLookIdFromProduct < ActiveRecord::Migration
  def change
    remove_column :products, :look_id
  end
end
