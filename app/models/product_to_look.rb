class ProductToLook < ActiveRecord::Base
  attr_accessible :product_id, :look_id

  #belongs_to :product
  #belongs_to :look, :class_name => 'Product'

  #belongs_to :look_product, :class_name => "Product", :foreign_key => :look_id
  #belongs_to :product_look, :class_name => "Look", :foreign_key => :product_id
end
