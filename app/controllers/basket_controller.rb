class BasketController < ApplicationController
  def my_basket
    @order = Order.new

    unless current_user.nil?
      @order.user_id = current_user.id
      @order.email = current_user.email
      @order.name = current_user.full_name unless current_user.full_name.empty?
      @order.phone = current_user.phone unless current_user.phone?
      @order.address = current_user.address unless current_user.address?
    end

  end
end
