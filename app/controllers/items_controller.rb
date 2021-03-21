class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :move_to_index, only: [:edit, :update]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
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
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :category_id, :condition_id, :delivery_id, :prefecture_id,
                                 :shipping_date_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless Item.find(params[:id]).user.id.to_i == current_user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
