class CartsController < ApplicationController
  def list
    if current_user
      @carts = Cart.where( user_id: current_user.id ).all
    end
  end
  
  def create
    cart_param = {
      :user_id => current_user.id,
      :merchandise_id => params[:id], # it should be guest_id actually :number_of_items => params[:how_many]
    }
    @cart = Cart.new( cart_param ) 
    respond_to do |format|
      if @cart.save
        format.html { redirect_to merchandises_path, notice: 'Item(s) had been
       added to a cart.' }
        format.json { render json: @cart, status: :created, location: @cart }
      else
        format.html { redirect_to merchandise_path }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end 
     end
   end
end
