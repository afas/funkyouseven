class WelcomesController < ApplicationController
  load_and_authorize_resource

  # GET /welcomes/1
  # GET /welcomes/1.json
  def home
    #@welcome = Welcome.find(params[:id])

    @articles_sidebar = Post.side_bar
    @top_slider = Product.valid_products.where(:welcome_position_id => 0).limit(5).all
    @about_left = Product.valid_products.where(:welcome_position_id => 1).limit(5).all
    @about_bottom = Product.valid_products.where(:welcome_position_id => 2).limit(8).all
    @bottom_slider = Product.valid_products.where(:welcome_position_id => 3).limit(5).all
    @last = Product.valid_products.where(:welcome_position_id => 4).limit(8).all

    respond_to do |format|
      format.html # home.html.erb
      format.json { render json: @welcome }
    end
  end

  # GET /welcomes/1
  # GET /welcomes/1.json
  def show
    @welcome = Welcome.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @welcome }
    end
  end

  # GET /welcomes/1/edit
  def edit
    @welcome = Welcome.find(params[:id])
  end

  # PUT /welcomes/1
  # PUT /welcomes/1.json
  def update
    @welcome = Welcome.find(params[:id])

    respond_to do |format|
      if @welcome.update_attributes(params[:welcome])
        format.html { redirect_to @welcome, notice: 'Welcome was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @welcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /welcomes/1
  # DELETE /welcomes/1.json
  def destroy
    @welcome = Welcome.find(params[:id])
    @welcome.destroy

    respond_to do |format|
      format.html { redirect_to welcomes_url }
      format.json { head :no_content }
    end
  end
end
