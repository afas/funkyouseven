class CoverMagazinesController < ApplicationController
  # GET /cover_magazines
  # GET /cover_magazines.json
  def index
    @cover_magazines = CoverMagazine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cover_magazines }
    end
  end

  # GET /cover_magazines/1
  # GET /cover_magazines/1.json
  def show
    @cover_magazine = CoverMagazine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cover_magazine }
    end
  end

  # GET /cover_magazines/new
  # GET /cover_magazines/new.json
  def new
    @cover_magazine = CoverMagazine.new

    respond_to do |format|
      format.html { render layout: "editor" }
      format.json { render json: @cover_magazine }
    end
  end

  # GET /cover_magazines/new
  # GET /cover_magazines/new.json
  def new_from_post()
    unless params[:post_id].nil?
      @cover_magazine = CoverMagazine.new_from_post(params[:post_id])
    else
      @cover_magazine = CoverMagazine.new
    end

    render :layout => false

  end

  # GET /cover_magazines/1/edit
  def edit
    @cover_magazine = CoverMagazine.find(params[:id])
    render layout: "editor"
  end

  # POST /cover_magazines
  # POST /cover_magazines.json
  def create
    @cover_magazine = CoverMagazine.new(params[:cover_magazine])

    respond_to do |format|
      if @cover_magazine.save
        format.html { redirect_to magazine_path, notice: 'Cover magazine was successfully created.' }
        format.json { render json: @cover_magazine, status: :created, location: @cover_magazine }
      else
        format.html { render action: "new" }
        format.json { render json: @cover_magazine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cover_magazines/1
  # PUT /cover_magazines/1.json
  def update
    @cover_magazine = CoverMagazine.find(params[:id])

    respond_to do |format|
      if @cover_magazine.update_attributes(params[:cover_magazine])
        format.html { redirect_to magazine_path, notice: 'Cover magazine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cover_magazine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cover_magazines/1
  # DELETE /cover_magazines/1.json
  def destroy
    @cover_magazine = CoverMagazine.find(params[:id])
    @cover_magazine.destroy

    respond_to do |format|
      format.html { redirect_to cover_magazines_url }
      format.json { head :no_content }
    end
  end
end
