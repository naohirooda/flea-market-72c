class ItemsController < ApplicationController

  def index
  end

  def show
    @item = Item.find(params[:id])
    @images = @item.images.where(params[:id])
    @prefecture = Prefecture.find(@item.start_address)
  end

  def new
    @item = Item.new
    @item.images.new
    @item.build_brand
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to controller: 'items', action: 'new'
    end 
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :status, :delivery_fee, :start_address, :shipping_date, :price, :trading_status, brand_attributes: [:name], images_attributes: [:src]).merge(user_id: current_user.id)
  end
end
