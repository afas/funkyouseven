class ShopSectionsController < ApplicationController
  load_and_authorize_resource

  # GET /shop_sections
  # GET /shop_sections.json
  def index
    @shop_sections = ShopSection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shop_sections }
    end
  end

  # GET /shop_sections/1
  # GET /shop_sections/1.json
  def show
    if params[:short_url]
      @shop_section = ShopSection.find_by_short_url(params[:short_url])
    else
      @shop_section = ShopSection.find(params[:id])
    end

    raise NotFound unless @shop_section

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shop_section }
    end
  end

  # GET /shop_sections/new
  # GET /shop_sections/new.json
  def new
    @shop_section = ShopSection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shop_section }
    end
  end

  # GET /shop_sections/1/edit
  def edit
    @shop_section = ShopSection.find(params[:id])
  end

  # POST /shop_sections
  # POST /shop_sections.json
  def create
    @shop_section = ShopSection.new(params[:shop_section])

    respond_to do |format|
      if @shop_section.save
        format.html { redirect_to @shop_section, notice: 'Shop section was successfully created.' }
        format.json { render json: @shop_section, status: :created, location: @shop_section }
      else
        format.html { render action: "new" }
        format.json { render json: @shop_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shop_sections/1
  # PUT /shop_sections/1.json
  def update
    @shop_section = ShopSection.find(params[:id])

    respond_to do |format|
      if @shop_section.update_attributes(params[:shop_section])
        format.html { redirect_to @shop_section, notice: 'Shop section was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shop_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_sections/1
  # DELETE /shop_sections/1.json
  def destroy
    @shop_section = ShopSection.find(params[:id])
    @shop_section.destroy

    respond_to do |format|
      format.html { redirect_to shop_sections_url }
      format.json { head :no_content }
    end
  end
end
