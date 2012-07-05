class OrdersController < ApplicationController
  load_and_authorize_resource

  # GET /orders
  # GET /orders.json
  #def index
  #  @orders = Order.all
  #
  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.json { render json: @orders }
  #  end
  #end

  # GET /orders/1
  # GET /orders/1.json
  #def show
  #  @order = Order.find(params[:id])
  #
  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.json { render json: @order }
  #  end
  #end

  # GET /orders/new
  # GET /orders/new.json
  #def new
  #  @order = Order.new
  #
  #  respond_to do |format|
  #    format.html { render layout: "editor" }
  #    format.json { render json: @order }
  #  end
  #end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
    @map_point = @order.to_gmaps4rails
    render layout: "editor"
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        @order.add_order_items_from_basket(@basket)

        if @order.user_create
          UserMailer.new_user_from_order(@order.user).deliver
        end

        unless current_user.nil?
          OrderMailer.new_order(@order).deliver
        end

        session[:basket] = nil

        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.js { render notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new", layout: "editor" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to  edit_user_registration_path, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", layout: "editor" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
