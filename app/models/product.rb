class Product < ActiveRecord::Base
  attr_accessible :title,
                  :brand_id,
                  :shop_section_id,
                  :section_category_id,
                  :look_id, #!!!
                  :career_id,
                  :sex_id,
                  :welcome_position_id, #!!!
                  :color,
                  :composition,
                  :description,
                  :price,
                  :season

  belongs_to :brand
  belongs_to :shop_section
  belongs_to :section_category


  def career
    Career.by_code(career_id)
  end

  def sex
    Sex.by_code(sex_id)
  end

end
