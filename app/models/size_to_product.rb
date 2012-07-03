class SizeToProduct < ActiveRecord::Base

  belongs_to :product

  attr_accessible :product_id, :size_id, :product_count

end
