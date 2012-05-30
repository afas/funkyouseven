class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :title
      t.text :description
      t.string :short_url

      t.timestamps
    end
  end
end
