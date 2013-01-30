class ProductImage < ActiveRecord::Base
  attr_accessible :product_id, :title, :cover, :image, :image_content_type, :image_file_name, :image_file_size
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  belongs_to :product

  has_attached_file :image,
                    :styles => {
                        :preview_circle => "80x80#",
                        :preview_item => "300x370#",
                        :preview_item_higher => "300x460#",
                        :full => {:geometry => "980x648#", :processors => [:cropper]},
                        :slider => {:geometry => "638x422#", :processors => [:cropper]},
                        :original => "1500x1500>"
                    },
                    :default_url => "/product_images/default.jpg",
                    :url => "/product_images/:id/:style_:filename"
                    #:path => ":rails_root/public/system/users/images/:id/:style/:filename",
                    #:url => "/system/users/images/:id/:style/:filename"


  validates_attachment_presence :image, :message => I18n.t("paperclip.errors.presence")
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :message => I18n.t("paperclip.errors.content_type")

  default_scope order("product_images.image_order, product_images.id DESC")



  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

end
