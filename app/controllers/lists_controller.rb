class ListsController < ApplicationController

  def index
    @lists = List.all
    @list = List.new
  end
  
  def show
    # Pull up list from params
    @list = List.find(params[:id])
    
    # Pull in associated items
    @items = Item.where(list_id: params[:id])
    
    # For generating a new item in the list
    @item = Item.new
    
  end
  
  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    
    EmailButton.send_list(@list).deliver
    if @list.update(list_params)
      redirect_to @list, notice: "Your email was sent to #{@list.email}" 
    else
      redirect_to root_path
    end
    
    
  end
  
  
  
  def create
    @list = List.create(list_params)
    redirect_to list_path(@list)
  end

  private
  def list_params
    params.require(:list).permit(:name, :email)
  end
  
end
