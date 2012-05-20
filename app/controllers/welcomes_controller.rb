class WelcomesController < ApplicationController
  # GET /welcomes/1
  # GET /welcomes/1.json
  def home
    #@welcome = Welcome.find(params[:id])

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
