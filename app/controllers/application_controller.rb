class ApplicationController < ActionController::Base
  include ListOfCategories
  before_action :list
  before_action :get_locale

  def after_sign_in_path_for(resource)


    @user = User.find(current_user.id)

    if Cart.exists?(@user.cart_id)
      if !session[:cart_id].nil?
        @user.cart_id = session[:cart_id]
        @user.save
      else
        session[:cart_id] = @user.cart_id
      end
    end

    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end

  def get_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
