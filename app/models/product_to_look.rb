class ProductToLook < ActiveRecord::Base
  attr_accessible :product_id, :look_id

  belongs_to :product
  belongs_to :look, :foreign_key => :product_id
end
