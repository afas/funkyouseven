class SectionCategoriesController < ApplicationController
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
      format.html # new.html.erb
      format.json { render json: @section_category }
    end
  end

  # GET /section_categories/1/edit
  def edit
    @section_category = SectionCategory.find(params[:id])
  end

  # POST /section_categories
  # POST /section_categories.json
  def create
    @section_category = SectionCategory.new(params[:section_category])

    respond_to do |format|
      if @section_category.save
        format.html { redirect_to @section_category, notice: 'Section category was successfully created.' }
        format.json { render json: @section_category, status: :created, location: @section_category }
      else
        format.html { render action: "new" }
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
        format.html { redirect_to @section_category, notice: 'Section category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
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
      format.html { redirect_to section_categories_url }
      format.json { head :no_content }
    end
  end
end
