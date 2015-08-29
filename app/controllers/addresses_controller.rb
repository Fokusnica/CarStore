class AddressesController < ApplicationController


  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index

    @addresses = Address.all
  end

  def new

    @address = Address.new

  end

  def show

  end

  def create

    @address = Address.new(address_params.merge(:user_id => current_user.id))
    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: 'Address was successfully created.' }
      else
        render text: "Fuck!"
      end
    end
  end

  private

  def set_address
    @user_address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:name, :address, :phone, :country, :city)
  end


end
