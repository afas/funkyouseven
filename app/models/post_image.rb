class PostImage < ActiveRecord::Base
  attr_accessible :post_id, :title, :cover, :image, :image_content_type, :image_file_name, :image_file_size

  belongs_to :post

  has_attached_file :image,
                    :styles => {
                        :preview_item => "300x200#",
                        :album_normal => "637x428#",
                        :big => "979x614#"
                    },
                    :default_url =>  "/post_images/default.png",
                    :url =>  "/post_images/:id/:style_:basename.:extension"

  validates_attachment_presence :image, :message => I18n.t("paperclip.errors.presence")
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :message => I18n.t("paperclip.errors.content_type")
  
  default_scope order("image_order, id")

end
