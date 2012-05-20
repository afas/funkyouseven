#encoding: utf-8
class CreateShopSections < ActiveRecord::Migration
  def change
    create_table :shop_sections do |t|
      t.string :name, :null => false, :unique => true
      t.string :short_url, :null => false, :unique => true
      t.integer :list_order, :default => 0
      t.text :description

      t.timestamps
    end

    add_index :shop_sections, :name, :unique => true
    add_index :shop_sections, :short_url, :unique => true

    ShopSection.create(:name => "Одежда", :short_url => "wear", :list_order => 0)
    ShopSection.create(:name => "Снаряжение", :short_url => "gear", :list_order => 1)
    ShopSection.create(:name => "Экипировка", :short_url => "equipment", :list_order => 2)
    ShopSection.create(:name => "Бренды", :short_url => "brands", :list_order => 3)
  end
end
