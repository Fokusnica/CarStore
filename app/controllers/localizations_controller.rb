class LocalizationsController < ApplicationController


    def change_locale

      session[:locale] = params[:locale]
      redirect_to :back
    end
  end

