class ProductImage < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.integer :product_id
      t.string :title
      t.boolean :cover, :default => false
      t.boolean :preview, :default => false
      t.integer :image_order, :default => 0
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size

      t.timestamps
    end
    add_index :product_images, :image_order
    add_index :product_images, :product_id
    add_index :product_images, :cover
    add_index :product_images, :preview
  end
end
