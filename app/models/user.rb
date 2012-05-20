class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :avatar, :role, :nickname, :name, :surname, :career, :city, :address, :phone, :about


  def author_name
    "#{self.name} #{self.surname}"
  end

  def admin?
    if self.role == 0
      return true
    else
      return false
    end
  end

end
