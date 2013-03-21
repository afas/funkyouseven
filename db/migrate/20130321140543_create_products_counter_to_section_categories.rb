class CreateProductsCounterToSectionCategories < ActiveRecord::Migration
  def change
    add_column :section_categories, :products_count, :integer, :default => 0
    SectionCategory.unscoped.all.each do |category|
      SectionCategory.update_counters category.id, :products_count => category.products.length
    end
  end
end
