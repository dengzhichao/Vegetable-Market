class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @orders = Order.all
    respond_with(@orders)
  end

  def show
    respond_with(@order)
  end

  def new
    @carts = Cart.where( user_id: current_user.id) 
    if !@carts
      redirect_to carts_list_path 
    end
    @order = Order.new
    @order.customer_id = current_user.customer.id 
    @order.order_status_id = OrderStatus.find_by_s('Listed').id 
    if @order.save
      @carts.each do |cart|
        @order_item = OrderItem.new
        @order_item.order_id = @order.id 
        @order_item.merchandise_id = cart.merchandise_id 
        @order_item.number_of_items = cart.number_of_items 
        @order_item.price = cart.merchandise.price 
        @order_item.save
        cart.destroy
      end
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @order } 
      end
    else
      redirect_to carts_list_path
    end
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.save
    respond_with(@order)
  end

  def update
    @order.update(order_params)
    respond_with(@order)
  end

  def destroy
    @order.destroy
    respond_with(@order)
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:customer_id, :order_status_id, :shipped_at, :traceable_number)
    end
end
