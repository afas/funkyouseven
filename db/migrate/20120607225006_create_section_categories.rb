#encoding: utf-8
class CreateSectionCategories < ActiveRecord::Migration
  def change
    create_table :section_categories do |t|
      t.string :name, :null => false
      t.text :description
      t.integer :shop_section_id, :null => false
      t.string :short_url, :null => false
      t.timestamps
    end

    add_index :section_categories, :short_url
    add_index :section_categories, :shop_section_id

    SectionCategory.create(:name => "Верхняя одежда", :short_url => "outerwear", :shop_section_id => 1)
    SectionCategory.create(:name => "Платья", :short_url => "dresses", :shop_section_id => 1)
    SectionCategory.create(:name => "Футболки", :short_url => "t-shirts", :shop_section_id => 1)
    SectionCategory.create(:name => "Рубашки", :short_url => "shirts", :shop_section_id => 1)
    SectionCategory.create(:name => "Толстовки", :short_url => "hoodies", :shop_section_id => 1)
    SectionCategory.create(:name => "Шорты/Юбки", :short_url => "shorts-skirts", :shop_section_id => 1)
    SectionCategory.create(:name => "Штаны", :short_url => "pants", :shop_section_id => 1)
    SectionCategory.create(:name => "Обувь", :short_url => "shoes", :shop_section_id => 1)
    SectionCategory.create(:name => "Нижнее белье", :short_url => "underwear", :shop_section_id => 1)
    SectionCategory.create(:name => "Аксессуары", :short_url => "accessories", :shop_section_id => 1)

    SectionCategory.create(:name => "Снаряжение", :short_url => "equipment", :shop_section_id => 2)
    SectionCategory.create(:name => "Велосипеды", :short_url => "bicycles", :shop_section_id => 2)
    SectionCategory.create(:name => "Доски", :short_url => "boards", :shop_section_id => 2)
    SectionCategory.create(:name => "Крепления", :short_url => "fixtures", :shop_section_id => 2)
    SectionCategory.create(:name => "Запчасти", :short_url => "spares", :shop_section_id => 2)

    SectionCategory.create(:name => "Защита", :short_url => "protection", :shop_section_id => 3)
    SectionCategory.create(:name => "Перчатки", :short_url => "gloves", :shop_section_id => 3)
    SectionCategory.create(:name => "Термобелье", :short_url => "underwear", :shop_section_id => 3)
    SectionCategory.create(:name => "Куртки", :short_url => "jackets", :shop_section_id => 3)
    SectionCategory.create(:name => "Штаны", :short_url => "pants", :shop_section_id => 3)
    SectionCategory.create(:name => "Сноу-юбки", :short_url => "snow-skirt", :shop_section_id => 3)
    SectionCategory.create(:name => "Ботинки", :short_url => "boots", :shop_section_id => 3)
    SectionCategory.create(:name => "Носки", :short_url => "socks", :shop_section_id => 3)
    SectionCategory.create(:name => "Маски", :short_url => "masks", :shop_section_id => 3)
  end
end
