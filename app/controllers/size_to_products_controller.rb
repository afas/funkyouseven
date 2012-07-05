class SizeToProductsController < ApplicationController
  load_and_authorize_resource

  # GET /size_to_products
  # GET /size_to_products.json
  def index
    @size_to_products = SizeToProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @size_to_products }
    end
  end

  # GET /size_to_products/1
  # GET /size_to_products/1.json
  def show
    @size_to_product = SizeToProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @size_to_product }
    end
  end

  # GET /size_to_products/new
  # GET /size_to_products/new.json
  def new
    @size_to_product = SizeToProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @size_to_product }
    end
  end

  # GET /size_to_products/1/edit
  def edit
    @size_to_product = SizeToProduct.find(params[:id])
  end

  # POST /size_to_products
  # POST /size_to_products.json
  def create
    @size_to_product = SizeToProduct.new(params[:size_to_product])

    respond_to do |format|
      if @size_to_product.save
        format.html { redirect_to @size_to_product, notice: 'Size to product was successfully created.' }
        format.json { render json: @size_to_product, status: :created, location: @size_to_product }
      else
        format.html { render action: "new" }
        format.json { render json: @size_to_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /size_to_products/1
  # PUT /size_to_products/1.json
  def update
    @size_to_product = SizeToProduct.find(params[:id])

    respond_to do |format|
      if @size_to_product.update_attributes(params[:size_to_product])
        format.html { redirect_to @size_to_product, notice: 'Size to product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @size_to_product.errors, status: :unprocessable_entity }
      end
    end
  end

  def size_to_product_count
    product_id = params[:product_id]
    size_id = params[:size_id]
    product_count = params[:product_count]
    
    size_to_product = SizeToProduct.find_by_product_id_and_size_id(product_id, size_id)

    unless size_to_product.nil?
      if product_count == 0
        size_to_product.destroy
      else
        size_to_product.product_count = product_count
        size_to_product.save
      end
    else
      size_to_product = SizeToProduct.create(:product_id => product_id, :size_id => size_id, :product_count => product_count)
    end
  end

  # DELETE /size_to_products/1
  # DELETE /size_to_products/1.json
  def destroy
    @size_to_product = SizeToProduct.find(params[:id])
    @size_to_product.destroy

    respond_to do |format|
      format.html { redirect_to size_to_products_url }
      format.json { head :no_content }
    end
  end
end
