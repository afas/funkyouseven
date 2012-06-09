class AddImageToStatics < ActiveRecord::Migration
  def change
    add_column :statics, :image_file_name, :string
    add_column :statics, :image_content_type, :string
    add_column :statics, :image_file_size, :string
  end
end
