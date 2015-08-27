class ApplicationController < ActionController::Base
  include ListOfCategories
  before_action :list

  def after_sign_in_path_for(resource)

    #
    # if Cart.exists?(session[:cart_id])
    #   @cart = Cart.find(session[:cart_id])
    #   @user = User.find(current_user.id)
    #   @user.cart_id = @cart.id
    #   @user.save
    # end

    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
