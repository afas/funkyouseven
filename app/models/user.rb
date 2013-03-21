class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :avatar, :role, :nickname, :name, :surname, :career, :city, :address, :phone, :about

  has_attached_file :avatar,
                    :styles => {
                        :small => "34x34#",
                        :big => "300x370#"
                    },
#                    :default_url =>  "/user_avatar/default.png",
                    :url =>  "/user_avatar/:id/:style_:basename.:extension"

  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :message => I18n.t("paperclip.errors.content_type")

  default_scope order(:surname, :name)

  def full_name
    "#{self.name} #{self.nickname} #{self.surname}"
  end

  def admin?
    if self.role == 0
      return true
    else
      return false
    end
  end

  def redactor?
    if self.role == 1 || self.role == 0
      return true
    else
      return false
    end
  end

  def courier?
    if self.role == 2 || self.role == 1 || self.role == 0
      return true
    else
      return false
    end
  end

end
