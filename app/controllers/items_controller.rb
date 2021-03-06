class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, except:  [:index, :show, :new, :create]
  before_action :item_presence, only: [:edit, :update, :destory]


  def index
    @items = Item.order("created_at DESC")
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
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end
    
  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:content,:category_id,:sales_state_id,:delivery_charge_id,:prefecture_id,:day_to_ship_id,:price,:image).merge(user_id: current_user.id)
  end

  
  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def item_presence 
    if @item.purchase_history.present? 
      redirect_to root_path
    end
  end
end
