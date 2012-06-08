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

    SectionCategory.create(:name => "Верхняя одежда", :short_url => "verhnijodezhd", :shop_section_id => 1)
    SectionCategory.create(:name => "Джинсы", :short_url => "jeans", :shop_section_id => 1)
    SectionCategory.create(:name => "Футболки", :short_url => "futbolk", :shop_section_id => 1)
    SectionCategory.create(:name => "Обувь", :short_url => "obuv", :shop_section_id => 1)

  end
end
