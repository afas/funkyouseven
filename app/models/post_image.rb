class PostImage < ActiveRecord::Base
  attr_accessible :post_id, :title, :cover, :image, :image_content_type, :image_file_name, :image_file_size
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  belongs_to :post

  has_attached_file :image,
                    :styles => {
                        :preview_item => "300x200#",
                        :album_normal => {:geometry => "638x400#", :processors => [:cropper]},
                        :big => {:geometry => "980x614#", :processors => [:cropper]},
                        :original => "1500x1500>"
                    },
                    :default_url => "/post_images/default.jpg",
                    :url => "/post_images/:id/:style_:basename.:extension"

  validates_attachment_presence :image, :message => I18n.t("paperclip.errors.presence")
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :message => I18n.t("paperclip.errors.content_type")

  default_scope order("image_order, id")

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
end
