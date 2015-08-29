class OrdersController < ApplicationController

  include CurrentCart
  before_action :set_user_cart, only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index

  end

  def new
    if @cart.line_items.empty?
      redirect_to root_path, notice: "Your cart is empty"
      return
    end
    @order = Order.new

  end

  def show

  end

  def create


    @order = Order.new(order_params.merge(:price => @cart.total_summ, :user_id => current_user.id,))
    @order.add_line_items_from_cart(@cart)


    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        current_user.cart_id = nil
        format.html { redirect_to root_path, notice:
                                               'Thank you for your order.' }
        format.json { render action: 'show', status: :created,
                             location: @order }
      else
        @cart = current_cart
        format.html { render action: 'new' }
        format.json { render json: @order.errors,
                             status: :unprocessable_entity }
      end
    end
  end


  def order_history

    @order_history = Order.where(:user_id => current_user.id)
  end


  private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:address_id)
  end
end
