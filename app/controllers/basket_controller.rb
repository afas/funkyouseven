class BasketController < ApplicationController

  def my_basket
    @order = Order.new
    @static = Static.find_by_short_url("basket")

    logger.info session.inspect

    unless current_user.nil?
      @order.user_id = current_user.id
      @order.email = current_user.email
      @order.name = current_user.full_name unless current_user.full_name.empty?
      @order.phone = current_user.phone unless current_user.phone?
      @order.address = current_user.address unless current_user.address?
    end
  end


  def add_product
#    session[:basket] = nil
    product = Product.find(params[:product_id])
    @basket.add_product(product, params[:size_id])
    render :layout => false
  end

  def set_count

  end


  def remove_product
  end

  def empty
  end

end
