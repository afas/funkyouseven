class SectionCategory < ActiveRecord::Base
  attr_accessible :description, :name, :shop_section_id, :short_url

  belongs_to :shop_section
  has_many :products

  default_scope order(:name)

end
