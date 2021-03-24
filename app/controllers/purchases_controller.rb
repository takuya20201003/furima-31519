class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_root_path

  def index
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def create
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
     if @purchase_shipping_address.valid?
      pay_item
      @purchase_shipping_address.save
      redirect_to root_path
     else
      render action: :index
     end
  end

  private
  
  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root_path
    if current_user = @item.user
      redirect_to root_path
    elsif @item.purchase
      redirect_to root_path
    end
  end
end
