class ProductToLooksController < ApplicationController
  #load_and_authorize_resource

  def check
    product_id = params[:product_id].to_i
    look_id = params[:look_id].to_i
    yes = params[:yes]
    already = ProductToLook.find_all_by_product_id_and_look_id(product_id, look_id)

    look = Product.find(look_id)
    if yes == "true"
      if already.empty?
        ProductToLook.create(:product_id => product_id, :look_id => look_id)
        look.reprocess_price
      end
    else
      ProductToLook.destroy_all(:product_id => product_id, :look_id => look_id)
      look.reprocess_price
    end

  end

  def create
  end


end