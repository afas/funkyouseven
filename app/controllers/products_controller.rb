class ProductsController < ApplicationController
  load_and_authorize_resource

  def import_catalog
    wear_last_product_number = ShopSection.find_by_short_url("wear").last_product_number
    gear_last_product_number = ShopSection.find_by_short_url("gear").last_product_number
    equipment_last_product_number = ShopSection.find_by_short_url("equipment").last_product_number

    Product.import()

    @wear_imported = ShopSection.find_by_short_url("wear").last_product_number - wear_last_product_number
    @gear_imported = ShopSection.find_by_short_url("gear").last_product_number - gear_last_product_number
    @equipment_imported = ShopSection.find_by_short_url("equipment").last_product_number - equipment_last_product_number

    @articles_side_bar = Post.side_bar
    @shop_side_bar = Product.shop_side_bar
  end

  def not_publish
    @products = Product.not_publish#.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products
  # GET /products.json
  def index
    condition = ""

    @shop_section = ShopSection.find_by_short_url(params[:shop_section]) unless params[:shop_section].nil?
    condition += "shop_section_id = #{@shop_section.id}" unless @shop_section.nil?

    @section_category = SectionCategory.find_by_shop_section_id_and_short_url(@shop_section.id, params[:section_category]) unless @shop_section.nil? && params[:section_category].nil?
    condition += " and section_category_id = #{@section_category.id}" unless @section_category.nil?

    @products = Product.valid_products.where(condition).all#.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    @shop_section = @product.shop_section
    @section_category = @product.section_category

    @related_products = Product.valid_products.all

    @shop_section = @product.shop_section
    @section_category = @product.section_category

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html { render layout: "editor" }
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    render layout: "editor"
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new", layout: "editor" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", layout: "editor" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
