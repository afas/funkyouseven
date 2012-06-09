class Brand < ActiveRecord::Base
  attr_accessible :description, :short_url, :site_url, :name, :logo, :logo_content_type, :logo_file_name, :logo_file_size

  default_scope order(:name)

  has_attached_file :logo,
                    :styles => {
                        :preview_item => "300x200#"
                    },
                    :default_url => "/brand_logos/default.png",
                    :url => "/brand_logos/:id/:style_:basename.:extension"

  validates_attachment_presence :logo, :message => I18n.t("paperclip.errors.presence")
  validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :message => I18n.t("paperclip.errors.content_type")

  has_many :products

end
