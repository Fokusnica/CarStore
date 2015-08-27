module CurrentCart
  extend ActiveSupport::Concern
  private
  def set_cart
    @cart = Cart.find(session[:cart_id])

  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id


  end

  def set_user_cart

    if user_signed_in?

      @user = User.find(current_user.id)

      if Cart.exists?(@user.cart_id)
        @cart = Cart.find(@user.cart_id)
      else
        @cart = Cart.create
        session[:cart_id] = @cart.id
        @user.cart_id = @cart.id
        @user.save
      end

    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end

    # if session[:cart_id].nil?
    # @user = User.find(current_user.id)
    # if Cart.exists?(session[:cart_id])
    #    @cart = Cart.find(session[:cart_id])
    # else
    #   @cart = Cart.create
    #   end
    # @user.cart_id = @cart.id
    # @user.save
    # session[:cart_id] = @cart.id
    # end


    # if Cart.exists?(session[:cart_id])
    #   @cart = Cart.find(session[:cart_id])
    # elsif
    #
    #
    #
    #
    #
    #
    #
    # if Cart.exists?(session[:cart_id])
    #   @cart = Cart.find(session[:cart_id])
    #
    #
    #   if User.exists?(current_user.id)
    #     @user = User.find(current_user.id)
    #     if @user.cart_id != nil
    #       session[:cart_id] = @user.cart_id
    #     else
    #       @user.cart_id = @cart.id
    #       @user.save
    #     end
    #   end
    #
    # else
    #   @cart = Cart.create
    #   session[:cart_id] = @cart.id
    #
    # end
  end

end