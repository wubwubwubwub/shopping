class ListsController < ApplicationController

  def index
    @lists = List.all
    @list = List.new
  end
  
  def show
    # Pull up list from params
    @list = List.includes(:items).find(params[:id])
    
    # Pull in associated items
    @items = Item.where(list_id: params[:id])
    
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])
    
    if @list.update(list_params)
      redirect_to @list, notice: "updated!"
    else
      render 'edit'
    end

    if params[:commit] == "Send Email!"          # use commit tag on form to specify an action
      EmailButton.send_list(@list, params[:send_to_address], params[:sent_from]).deliver
      redirect_to @list, notice: "Email was sent to #{params[:send_to_address]}"
    end
  end
  
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    
    redirect_to lists_path
  end
  
  def create
    @list = List.create(list_params)
    3.times { @list.items.create }

    redirect_to edit_list_path(@list)
  end
  
  private
  def list_params
    params.require(:list).permit(:name, items_attributes: [:id, :name, :quan, :notes, :_destroy])
  end
  
end
