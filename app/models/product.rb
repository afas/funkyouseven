class Product < ActiveRecord::Base
  attr_accessible :brand_id, :career_id, :category_id, :color, :composition, :description, :look_id, :price, :season, :sex_id, :shop_section_id, :title, :welcome_position_id
end
