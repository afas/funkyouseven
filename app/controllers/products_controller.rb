class ProductsController < ApplicationController
  load_and_authorize_resource

  before_filter :user_settings, :except => :destroy

  rescue_from NotFound, :with => :not_found
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

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
    @products = Product.not_publish

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def funk_yoo_shot
    @products = Product.not_publish

    respond_to do |format|
      format.json { render json: @products }
    end
  end

  # GET /products
  # GET /products.json
  def index
    condition = ""

    unless params[:shop_section].nil?
      @shop_section = ShopSection.find_by_short_url(params[:shop_section])
      unless @shop_section.nil?
        condition = "products.shop_section_id = #{@shop_section.id}"
        @user_settings["shop_section"] = @shop_section.id
        @user_settings.delete("section_category")
        @user_settings.delete("brand")
      end
    end

    unless @shop_section.nil? && params[:section_category].nil?
      @section_category = SectionCategory.find_by_shop_section_id_and_short_url(@shop_section.id, params[:section_category])
      unless @section_category.nil?
        condition += " and products.section_category_id = #{@section_category.id}"
        @user_settings["section_category"] = @section_category.id
      end
    end

    unless @user_settings["sex"].nil?
      condition += " and products.sex_id = #{@user_settings['sex']}"
    end

    unless @user_settings["career"].nil?

      unless @shop_section.nil?
        condition += " and products.career_id = #{@user_settings['career']}" if @shop_section.short_url != "wear"
      else
        condition += " and products.career_id = #{@user_settings['career']}"
      end
    end

    @page = (params[:page] || 1).to_i

    @products = Product.where(condition).valid_products.paginate(:page => @page)
    @more_products = Product.where(condition).valid_products.all.size() - Product.per_page * @page
    @more_products = nil if @more_products <= 0

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def page
    condition = "0 = 0"

    unless @user_settings["shop_section"].nil? || @user_settings["brand"]
      @shop_section = ShopSection.find(@user_settings["shop_section"])
      condition += " and products.shop_section_id = #{@shop_section.id}"
    end

    if !@shop_section.nil? && !@user_settings["section_category"].nil?
      @section_category = SectionCategory.find(@user_settings["section_category"])
      unless @section_category.nil?
        condition += " and products.section_category_id = #{@section_category.id}"
      end
    end

    unless @user_settings["sex"].nil?
      condition += " and products.sex_id = #{@user_settings["sex"]}"
    end

    unless @user_settings["career"].nil?
      condition += " and products.career_id = #{@user_settings["career"]}"
    end

    unless @user_settings["brand"].nil?
      condition += " and products.brand_id = #{@user_settings["brand"]}"
    end

    @page = (params[:page] || 1).to_i

    @products = Product.where(condition).valid_products.paginate(:page => @page)
    @more_products = Product.where(condition).valid_products.all.size() - Product.per_page * @page
    @more_products = nil if @more_products <= 0

    render :layout => false
  end

  def sex
    condition = "0 = 0"

    unless @user_settings["shop_section"].nil?
      @shop_section = ShopSection.find(@user_settings["shop_section"])
      condition += " and products.shop_section_id = #{@shop_section.id}"
    end

    if !@shop_section.nil? && !@user_settings["section_category"].nil?
      @section_category = SectionCategory.find(@user_settings["section_category"])
      unless @section_category.nil?
        condition += " and products.section_category_id = #{@section_category.id}"
      end
    end

    unless @user_settings["career"].nil?
      condition += " and products.career_id = #{@user_settings["career"]}"
    end

    unless params[:sex].nil?
      if params[:sex] == "empty"
        @user_settings.delete("sex")
      else
        condition += " and products.sex_id = #{params[:sex]}"
        @user_settings["sex"] = params[:sex]
      end
    end

    @page = 1

    @products = Product.where(condition).valid_products.paginate(:page => @page)
    @more_products = Product.where(condition).valid_products.all.size() - Product.per_page * @page
    @more_products = nil if @more_products <= 0

    render :layout => false, :action => "selectors"
  end

  def career
    condition = "0 = 0"

    unless @user_settings["shop_section"].nil?
      @shop_section = ShopSection.find(@user_settings["shop_section"])
      condition += " and products.shop_section_id = #{@shop_section.id}"
    end

    if !@shop_section.nil? && !@user_settings["section_category"].nil?
      @section_category = SectionCategory.find(@user_settings["section_category"])
      unless @section_category.nil?
        condition += " and products.section_category_id = #{@section_category.id}"
      end
    end

    unless @user_settings["sex"].nil?
      condition += " and products.sex_id = #{@user_settings["sex"]}"
    end

    unless params[:career].nil?
      if params[:career] == "empty"
        @user_settings.delete("career")
      else
        condition += " and products.career_id = #{params[:career]}"
        @user_settings["career"] = params[:career]
      end
    end

    @page = 1

    @products = Product.where(condition).valid_products.paginate(:page => @page)
    @more_products = Product.where(condition).valid_products.all.size() - Product.per_page * @page
    @more_products = nil if @more_products <= 0

    render :layout => false, :action => "selectors"
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    @shop_section = @product.shop_section
    @section_category = @product.section_category

    @related_products = Product.valid_products.limit(6)

    @shop_section = @product.shop_section
    @section_category = @product.section_category

    @more_looks = Product.more_looks(@product.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
    @looks = Product.all_looks

    respond_to do |format|
      format.html { render layout: "editor" }
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @looks = Product.all_looks

    render layout: "editor"
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        @looks = @product.looks
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

  private

  def user_settings
    session[:user_settings] ||= Hash.new()
    @user_settings = session[:user_settings]
  end

end