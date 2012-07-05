class SectionCategory < ActiveRecord::Base
  attr_accessible :description, :name, :shop_section_id, :short_url

  belongs_to :shop_section
  has_many :products
  #default_scope order(:name)

  before_save :generate_short_url

  private

  def generate_short_url
    self.short_url = Russian.transliterate(self.name.downcase.gsub(' ', '-')) if self.short_url.blank? && !self.name.blank?
  end

end