class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :default_data
  before_filter :find_cart, :except => :destroy

  rescue_from NotFound, :with => :not_found
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  private

  def find_cart
    session[:basket] ||= Basket.new
    @basket = session[:basket]
  end

  def default_data
    @welcome = Welcome.first

    @menu_left = ShopSection.main_menu
    @menu_right = Static.main_menu

    if controller_name == "registrations"
       unless current_user.nil?
         if current_user.admin?
           @my_orders = Order.order("created_at DESC").all
         else
           @my_orders = Order.where("user_id = ?", current_user.id).order("created_at DESC").all
         end
       end
    end

  end

  def access_denied
    redirect_to access_denied_path
  end

  def not_found
    redirect_to not_found_path
  end

end
