class AddParamsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :main_article, :boolean, :default => false
    add_column :posts, :cover_id, :integer
  end
end
