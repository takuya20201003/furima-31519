class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def create
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
     if @purchase_shipping_address.valid?
      pay_item
      @purchase_shipping_address.save
      redirect_to action: :index
     else
      render action: :index
     end
  end

  private
  
  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :prefecture, :municipality, :address, :building, :phone_number).merge(token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
       Payjp::Charge.create(
         amount: purchase_params[:price],
         card: purchase_params[:token],
         currency: 'jpy'
       )
  end
end
