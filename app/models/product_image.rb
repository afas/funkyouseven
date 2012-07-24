class ProductImage < ActiveRecord::Base
  attr_accessible :product_id, :title, :cover, :image, :image_content_type, :image_file_name, :image_file_size

  belongs_to :product

  has_attached_file :image,
                    :styles => {
                        :preview_circle => "80x80#",
                        :preview_item => "300x370#",
                        :preview_item_higher => "300x460#",
                        #:full => "645x623#",
                        :full => "980x623#",
                        :slider => "638x422#"
                    },
                    :default_url =>  "/product_images/default.jpg",
                    :url =>  "/product_images/:id/:style_:basename.:extension"

  validates_attachment_presence :image, :message => I18n.t("paperclip.errors.presence")
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :message => I18n.t("paperclip.errors.content_type")
  
  default_scope order("image_order, id DESC")

end
