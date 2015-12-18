class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @customers = Customer.all
    respond_with(@customers)
  end

  def show
    respond_with(@customer)
  end

  def new
    @customer = Customer.find_by_user_id( current_user.id ) 
    if @customer
      respond_with(@customer) 
    else
      @customer = Customer.new 
      @customer.user_id = current_user.id 
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @customer } 
      end
    end
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.user_id = current_user.id
    @customer.save
    respond_with(@customer)
  end

  def update
    @customer.update(customer_params)
    respond_with(@customer)
  end

  def destroy
    @customer.destroy
    respond_with(@customer)
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:user_id, :name, :zipcode, :street_address, :city, :phone)
    end
end
