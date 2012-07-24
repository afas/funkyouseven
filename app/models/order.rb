#encoding: utf-8
class Order < ActiveRecord::Base
  acts_as_gmappable

  self.per_page = 12

  attr_accessible :address, :comment, :internal_comment, :order_status_id, :pay_status_id, :user_id, :email, :name, :phone, :latitude, :longitude, :gmaps, :user_create

  attr_reader :email, :name, :phone, :user_create
  attr_writer :email, :name, :phone, :user_create

  belongs_to :user
  has_many :order_items

  scope :by_created, order(:created_at)
  scope :by_updated, order(:updated_at)
  scope :by_order_status, lambda { |order_status_id| where(:order_status_id, order_status_id).order("created_at DESC") }

  before_save :check_user_registration

  def gmaps4rails_address
    self.address
  end

  def gmaps4rails_infowindow
    "<h3>#{self.user.full_name}</h3><p><b>Статус: </b> #{OrderStatus.by_code(self.order_status_id)}<br/><b>Создан:</b> #{self.created_at}<br/><b>Обновлен:</b> #{self.updated_at}<br/><b>Телефон:</b> #{self.user.phone}<br/><b>Адрес доставки:</b> #{self.address}</p>"
  end

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
    #пользователь не установлен
    unless self.user_id
      user = User.find_by_email(self.email)
      #пользователь не авторизован
      if self.user.nil?
        password = Devise.friendly_token.first(7)

        user = User.create(:email => self.email,
                           :password => password,
                           :password_confirmation => password,
                           :name => self.name,
                           :phone => self.phone,
                           :address => self.address,
                           :role => 3
        )
        self.user_create = true
      end

      self.user = user
    end
  end
end
