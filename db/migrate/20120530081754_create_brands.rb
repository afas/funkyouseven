class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :title
      t.text :description
      t.string :short_url

      t.string :logo_file_name
      t.string :logo_content_type
      t.integer :logo_file_size

      t.timestamps
    end
    add_index :brands, :title
    add_index :brands, :short_url
  end
end
