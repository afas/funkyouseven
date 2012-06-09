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
    SectionCategory.create(:name => "Джинсы", :short_url => "jeans", :shop_section_id => 1)
    SectionCategory.create(:name => "Штаны", :short_url => "pants", :shop_section_id => 1)
    SectionCategory.create(:name => "Футболки", :short_url => "tshirts", :shop_section_id => 1)
    SectionCategory.create(:name => "Поло", :short_url => "polo", :shop_section_id => 1)
    SectionCategory.create(:name => "Толстовки", :short_url => "hoodies", :shop_section_id => 1)
    SectionCategory.create(:name => "Рубашки", :short_url => "shirts", :shop_section_id => 1)
    SectionCategory.create(:name => "Сумки", :short_url => "bags", :shop_section_id => 1)
    SectionCategory.create(:name => "Обувь", :short_url => "shoes", :shop_section_id => 1)

  end
end
