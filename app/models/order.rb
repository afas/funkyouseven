class Order < ActiveRecord::Base
  attr_accessible :address, :comment, :order_status, :pay_status, :user_id, :email, :name, :phone, :user_created

  attr_reader :email, :name, :phone, :user_created
  attr_writer :email, :name, :phone, :user_created

#  validates_presence_of :user_id, :address

  belongs_to :user
  has_many :order_items

  scope :by_created, order(:created_at)
  scope :by_updated, order(:updated_at)

  before_create :check_user_registration

  def add_order_items_from_basket(basket)
    basket.items.each do |item|
      size_to_product = SizeToProduct.find_by_product_id_and_size_id(item.product.id, item.product_size)
      size_to_product.product_count -= item.product_count
      size_to_product.save

      order_item = OrderItem.from_basket_item(item)
      order_items << order_item
    end
  end

  private

  def check_user_registration
    user ||= User.new

    if user.new_record?
      not_auth_user = User.find_by_email(self.email)
      if not_auth_user.nil?
        password = Devise.friendly_token.first(8)

        #user = User.create!(:email => self.email,
        #                    :password => password,
        #                    :password_confirmation => password,
        #                    :name => self.name,
        #                    :phone => self.phone,
        #                    :address => self.address
        #)

        self.user_created = true
      end
    else
      self.user_created = false
    end

    self.user_id = user.id
  end

end
