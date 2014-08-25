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
    EmailButton.send_list(@list, params[:send_to_address]).deliver
    
    if true
      redirect_to @list, notice: "Your email was sent to #{@list.email}" 
    else
      redirect_to root_path
    end
    
  end

  
  def create
    @list = List.create(list_params)
    redirect_to list_path(@list)
  end
  
  def sendemail
    @list = List.find(params[:id])
    EmailButton.send_list(@list, params[:send_to_address]).deliver
    redirect_to @list, notice: 'Your list has been sent!'
  end
  
  
  
  

  private
  def list_params
    params.require(:list).permit(:name, :email, :send_to_address)
  end
  
end
