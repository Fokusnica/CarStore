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

  def ajax
    @address = Address.new(ajax_params)
    respond_to do |format|
      if @address.save
        format.html { redirect_to user_addresses_addresses_path, notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        render text: "Fuck!"
      end
    end
  end


  def create

    @address = Address.new(address_params.merge(:user_id => current_user.id))
    respond_to do |format|
      if @address.save
        format.html { redirect_to user_addresses_addresses_path, notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        render text: "Fuck!"
      end
    end
  end

  def update
    if @address.update(address_params)
      redirect_to user_addresses_addresses_path
    else
      render 'edit'
    end
  end

  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to user_addresses_addresses_path, notice: 'Address deleted' }
      format.json { head :no_content }
    end
  end

  def user_addresses

    @user_addresses = Address.where(:user_id => current_user.id)
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:name, :address, :phone, :country, :city, )
  end

  def ajax_params
    params.require(:address).permit(:name, :address, :phone, :country, :city, :user_id, :title)
  end


end
