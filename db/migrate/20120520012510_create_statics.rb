#encoding: utf-8
class CreateStatics < ActiveRecord::Migration
  def change
    create_table :statics do |t|
      t.string :title, :null => false, :unique => true
      t.string :short_url, :null => false, :unique => true
      t.integer :list_order, :default => 0
      t.text :description
      t.text :content

      t.string :image_file_name
      t.string :image_content_type
      t.string :image_file_size

      t.timestamps
    end

    add_index :statics, :title, :unique => true
    add_index :statics, :short_url, :unique => true

    Static.create(:title => "O нас", :short_url => "about", :list_order => 0)
    Static.create(:title => "Журнал", :short_url => "magazine", :list_order => 1)
    Static.create(:title => "Заказ и доставка", :short_url => "basket", :list_order => 2)
  end
end
