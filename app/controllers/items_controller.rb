class ItemsController < ApplicationController

  def create
    @item = Item.create(item_params)
    redirect_to :back
  end

  private
  def item_params
    params.require(:item).permit(:name, :list_id, :quan, :notes)
  end
    

end
