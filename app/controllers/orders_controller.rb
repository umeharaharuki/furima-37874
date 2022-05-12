class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
  params.require(:purchase_address).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building, :telephone).merge(user_id: current_user.id,item_id: params[:item_id])
  end
end