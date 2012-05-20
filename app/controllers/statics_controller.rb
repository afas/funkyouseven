class StaticsController < ApplicationController
  # GET /statics
  # GET /statics.json
  def index
    @statics = Static.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @statics }
    end
  end

  # GET /statics/1
  # GET /statics/1.json
  def show
    if params[:short_url]
      @static = Static.find_by_short_url(params[:short_url])
    else
      @static = Static.find(params[:id])
    end

    raise NotFound unless @static

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @static }
    end
  end

  # GET /statics/new
  # GET /statics/new.json
  def new
    @static = Static.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @static }
    end
  end

  # GET /statics/1/edit
  def edit
    @static = Static.find(params[:id])
  end

  # POST /statics
  # POST /statics.json
  def create
    @static = Static.new(params[:static])

    respond_to do |format|
      if @static.save
        format.html { redirect_to @static, notice: 'Static was successfully created.' }
        format.json { render json: @static, status: :created, location: @static }
      else
        format.html { render action: "new" }
        format.json { render json: @static.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /statics/1
  # PUT /statics/1.json
  def update
    @static = Static.find(params[:id])

    respond_to do |format|
      if @static.update_attributes(params[:static])
        format.html { redirect_to @static, notice: 'Static was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @static.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statics/1
  # DELETE /statics/1.json
  def destroy
    @static = Static.find(params[:id])
    @static.destroy

    respond_to do |format|
      format.html { redirect_to statics_url }
      format.json { head :no_content }
    end
  end
end
