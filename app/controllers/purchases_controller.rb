class PurchasesController < ApplicationController
  def index
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def create
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
     if @purchase_shipping_address.valid?
      @purchase_shipping_address.save
      redirect_to action: :index
     else
      render action: :new
     end
  end

  private
  
  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :prefecture, :municipality, :address, :building, :phone_number)
  end
end
