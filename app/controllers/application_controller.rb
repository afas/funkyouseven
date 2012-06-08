class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :default_data

  rescue_from NotFound, :with => :not_found
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  private

  def default_data
    @welcome = Welcome.first

    @menu_left = ShopSection.main_menu
    @menu_right = Static.main_menu

    puts controller_name

    if controller_name == "registrations" && !current_user.nil?
      @my_orders = Order.find_all_by_user_id(current_user.id)
    end

  end

  def access_denied
    redirect_to access_denied_path
  end

  def not_found
    redirect_to not_found_path
  end

end
