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
      t.integer :category_id
      t.integer :look_id
      t.integer :season
      t.integer :welcome_position_id

      t.timestamps
    end
  end
end
