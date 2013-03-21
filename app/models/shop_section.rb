class ShopSection < ActiveRecord::Base
  attr_accessible :description, :name, :short_url, :list_order, :last_product_number

  scope :sections, where("short_url != ?", "brands")
  scope :main_menu, order(:list_order)

#  default_scope order(:name)

  has_many :products
  has_many :section_categories

  def empty_section_categories
    SectionCategory.unscoped.where("products_count = ? and shop_section_id = ?", 0, self.id).all
  end

end
