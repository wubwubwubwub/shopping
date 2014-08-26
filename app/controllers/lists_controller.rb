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

    if params[:commit] == "Send Email!"          # use commit tag on form to specify an action
      EmailButton.send_list(@list, params[:send_to_address], params[:sent_from]).deliver
      redirect_to @list, notice: "Email was sent to #{params[:send_to_address]}"
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
