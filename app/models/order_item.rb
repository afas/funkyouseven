class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :product_count, :product_id, :product_size

  belongs_to :order
  belongs_to :product

  def self.create_from_basket_item(basket_item, order_id)
    order_item = self.new()
    order_item.order_id = order_id
    order_item.product_id = basket_item.product.id
    order_item.product_count = basket_item.product_count
    order_item.product_size = basket_item.product_size
    order_item.save
    order
  end

end
