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
        if !session[:cart_id].nil?
          @user.cart_id = session[:cart_id]
          @user.save
        else
          session[:cart_id] = @user.cart_id
        end

        @cart = Cart.find(@user.cart_id)

      else
        if Cart.exists?(session[:cart_id])
          @cart = Cart.find(session[:cart_id])
          @user.cart_id = session[:cart_id]
          @user.save
        else
          @cart = Cart.create
          session[:cart_id] = @cart.id
          @user.cart_id = @cart.id
          @user.save
        end
      end

    else
      set_cart
    end

  end

end