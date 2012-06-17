class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :product_count, :product_id, :product_size

  belongs_to :order
  belongs_to :product

  def self.from_basket_item(basket_item)
    order_item = self.new
    order_item.product = basket_item.product
    order_item.product_count = basket_item.count
    order_item.product_size = basket_item.size
    order_item
  end

end
