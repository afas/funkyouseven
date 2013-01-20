class SectionCategoriesController < ApplicationController
  load_and_authorize_resource

  # GET /section_categories
  # GET /section_categories.json
  def index
    @section_categories = SectionCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @section_categories }
    end
  end

  # GET /section_categories/1
  # GET /section_categories/1.json
  def show
    @section_category = SectionCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @section_category }
    end
  end

  # GET /section_categories/new
  # GET /section_categories/new.json
  def new
    @section_category = SectionCategory.new

    respond_to do |format|
      format.html { render layout: "editor" }
      format.json { render json: @section_category }
    end
  end

  # GET /section_categories/1/edit
  def edit
    @section_category = SectionCategory.find(params[:id])
    render layout: "editor"
  end

  # POST /section_categories
  # POST /section_categories.json
  def create
    @section_category = SectionCategory.new(params[:section_category])

    respond_to do |format|
      if @section_category.save
        format.html { redirect_to section_category_products_path(@section_category.shop_section.short_url, @section_category.short_url), notice: 'Section category was successfully created.' }
        format.json { render json: @section_category, status: :created, location: @section_category }
      else
        format.html { render action: "new", layout: "editor" }
        format.json { render json: @section_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /section_categories/1
  # PUT /section_categories/1.json
  def update
    @section_category = SectionCategory.find(params[:id])

    respond_to do |format|
      if @section_category.update_attributes(params[:section_category])
        format.html { redirect_to section_category_products_path(@section_category.shop_section.short_url, @section_category.short_url), notice: 'Section category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", layout: "editor" }
        format.json { render json: @section_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /section_categories/1
  # DELETE /section_categories/1.json
  def destroy
    @section_category = SectionCategory.find(params[:id])
    @section_category.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end
end
