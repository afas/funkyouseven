class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.text :description
      t.string :short_url
      t.string :site_url

      t.string :logo_file_name
      t.string :logo_content_type
      t.integer :logo_file_size

      t.timestamps
    end
    add_index :brands, :name
    add_index :brands, :short_url

    Brand.create(:name => "Neff", :short_url => "neff", :site_url => "http://neff.com")
    Brand.create(:name => "Burton", :short_url => "burton", :site_url => "http://burton.com")
  end
end
