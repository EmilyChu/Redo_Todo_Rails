class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.create! item_params
    if @item.save 
      flash[:notice]="Item created successfully!"
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    @item.destroy
    redirect_to list_path(@list)
  end

  def search
    @phrase = params["description"]
    @task = Item.all
  end

  def random
    @item = Item.all.sample
    @item.description
  end

private
def item_params
  params.require(:item).permit(:description, :due_date, :done)
end

end