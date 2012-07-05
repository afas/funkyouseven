class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :short_url
      t.integer :author_id
      t.text :description
      t.text :content
      t.boolean :video_emb, :default => false

      t.timestamps
    end
    add_index :posts, :title, :unique => true
    add_index :posts, :short_url, :unique => true
    add_index :posts, :author_id
  end
end
