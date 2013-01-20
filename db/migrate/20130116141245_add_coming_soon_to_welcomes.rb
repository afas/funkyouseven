class AddComingSoonToWelcomes < ActiveRecord::Migration
  def change
    add_column :welcomes, :coming_soon, :boolean, :default => true
  end
end
