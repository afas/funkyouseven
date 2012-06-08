class Order < ActiveRecord::Base
  attr_accessible :address, :comment, :order_status, :pay_status, :user_id, :email, :name, :phone

  attr_reader :email, :name, :phone
  attr_writer :email, :name, :phone

#  validates_presence_of :user_id, :address

  belongs_to :user

  scope :by_created, order(:created_at)
  scope :by_updated, order(:updated_at)

  before_create :check_user_registration

  private

  def check_user_registration
    user ||= User.new
    if user.new_record?
      user.email = self.email
      user.password = self.email
      user.name = self.name
      user.phone = self.phone
      user.address = self.address

      user.save

      self.user_id = user.id
    end
  end

end
