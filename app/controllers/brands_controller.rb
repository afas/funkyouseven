#encoding: utf-8
class BrandsController < ApplicationController
  load_and_authorize_resource

  # GET /brands
  # GET /brands.json
  def index
    @shop_section = ShopSection.find_by_short_url("brands")
    @brands = Brand.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @brands }
    end
  end

  # GET /brands/1
  # GET /brands/1.json
  def show
    session[:user_settings] ||= Hash.new()
    @user_settings = session[:user_settings]

    @shop_section = ShopSection.find_by_short_url("brands")

    @user_settings.delete("shop_section")

    @brand = Brand.find(params[:id])
    @user_settings["brand"] = @brand.id

    condition = "products.brand_id = #{@brand.id}"

    unless @user_settings["sex"].nil?
      condition += " and products.sex_id = #{@user_settings["sex"]}"
    end

    unless @user_settings["career"].nil?
      condition += " and products.career_id = #{@user_settings["career"]}"
    end

    @page = (params[:page] || 1).to_i

    @products = Product.where(condition).valid_products.paginate(:page => @page)
    @more_products = Product.where(condition).valid_products.all.size() - Product.per_page * @page
    @more_products = nil if @more_products <= 0

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @brand }
    end
  end

  # GET /brands/new
  # GET /brands/new.json
  def new
    @brand = Brand.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @brand }
    end
  end

  # GET /brands/1/edit
  def edit
    @brand = Brand.find(params[:id])
  end

  # POST /brands
  # POST /brands.json
  def create
    @brand = Brand.new(params[:brand])

    respond_to do |format|
      if @brand.save
        format.html { redirect_to @brand, notice: 'Brand was successfully created.' }
        format.json { render json: @brand, status: :created, location: @brand }
      else
        format.html { render action: "new" }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /brands/1
  # PUT /brands/1.json
  def update
    @brand = Brand.find(params[:id])

    respond_to do |format|
      if @brand.update_attributes(params[:brand])
        format.html { redirect_to @brand, notice: 'Успешно обновлена информация о производетеле.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brands/1
  # DELETE /brands/1.json
  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy

    respond_to do |format|
      format.html { redirect_to brands_url }
      format.json { head :no_content }
    end
  end
end
