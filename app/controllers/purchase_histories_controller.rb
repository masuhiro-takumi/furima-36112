class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :sold_out_item
  before_action :purchaser
  
  def index
    @purchase_history_purchaser = PurchaseHistoryPurchaser.new
  end

  def create
    @purchase_history_purchaser = PurchaseHistoryPurchaser.new(purchase_history_params)
    if @purchase_history_purchaser.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_history_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @purchase_history_purchaser.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_history_params
    params.require(:purchase_history_purchaser).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def sold_out_item
     if @item.purchase_history.present?
      redirect_to root_path
     end
  end

  def purchaser
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
