class ShopSection < ActiveRecord::Base
  attr_accessible :description, :name, :short_url, :list_order

  scope :main_menu, order(:list_order)

#  default_scope order(:name)

  has_many :products
  has_many :section_categories

end
