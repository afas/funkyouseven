class CreatePostImages < ActiveRecord::Migration
  def change
    create_table :post_images do |t|
      t.integer :post_id
      t.string :title
      t.boolean :cover, :default => false
      t.boolean :preview, :default => false
      t.integer :image_order, :default => 0
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size

      t.timestamps
    end

    add_index :post_images, :image_order
    add_index :post_images, :post_id
    add_index :post_images, :cover
    add_index :post_images, :preview

  end
end