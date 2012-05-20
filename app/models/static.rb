class Static < ActiveRecord::Base
  attr_accessible :content, :short_url, :title, :list_order

  scope :main_menu, order(:list_order)

end
