class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root_path, only: [:edit, :update, :destory]
  before_action :search_item, only: [:index, :search]


  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end
  
  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    @results = @p.result
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_charge_id, :prefecture_id,
                                 :completed_at_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_root_path
    if current_user != @item.user
      redirect_to root_path
    elsif @item.purchase
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def search_item
    @p = Item.ransack(params[:q])
  end
end