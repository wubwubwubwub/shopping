class ListsController < ApplicationController

  def index
    @lists = List.all
    @list = List.new
  end
  
  def show
    @list = List.find(params[:id])
    @items = Item.where(list_id: params[:id])
    @item = Item.new
  end
  
  def create
    @list = List.create(list_params)
    redirect_to list_path(@list)
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
  
end
