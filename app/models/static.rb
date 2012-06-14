class Static < ActiveRecord::Base

  attr_accessible :content, :short_url, :title, :list_order, :image, :image_content_type, :image_file_name, :image_file_size

  scope :main_menu, order(:list_order)

  has_attached_file :image,
                    :styles => {
                        :preview_item => "300x200#",
                        :album_normal => "637x428#",
                        :big => "979x614#"
                    },
                    :default_url =>  "/static_images/default.png",
                    :url =>  "/static_images/:id/:style_:basename.:extension"

#  validates_attachment_presence :image, :message => I18n.t("paperclip.errors.presence")
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :message => I18n.t("paperclip.errors.content_type")

end
