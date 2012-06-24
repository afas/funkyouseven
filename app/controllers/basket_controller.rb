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
    product = Product.find(params[:product_id].to_i)
    @basket.add_product(product, params[:size_id].to_i)
    render :layout => false
  end

  def set_count
    product = Product.find(params[:product_id].to_i)
    @current_item = @basket.set_count(params[:product_count].to_i, product, params[:size_id].to_i)
    render :layout => false
  end

  def remove_product
    @basket_item_id = ""
    product = Product.find(params[:product_id].to_i)
    basket_item = @basket.remove_product(product, params[:size_id].to_i)
    @basket_item_id = "#{product.id}-#{params[:size_id]}" if basket_item.nil?
    render :layout => false
  end

  def empty
    session[:basket] = nil
    render :layout => false
  end

end
