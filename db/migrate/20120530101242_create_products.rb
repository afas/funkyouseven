class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.float :price
      t.text :description
      t.string :color
      t.string :composition
      t.integer :brand_id
      t.integer :sex_id
      t.integer :career_id
      t.integer :shop_section_id
      t.integer :section_category_id
      t.integer :look_id
      t.string :season
      t.integer :welcome_position_id
      t.string :import_comment

      t.timestamps
    end
    add_index :products, :brand_id
    add_index :products, :sex_id
    add_index :products, :career_id
    add_index :products, :shop_section_id
    add_index :products, :section_category_id
    add_index :products, :look_id
    add_index :products, :welcome_position_id
    add_index :products, :season
  end
end
