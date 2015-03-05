class ListsController < ApplicationController

  def index
    @list = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)  #List.new(params.require(:name))
    if @list.save
      redirect_to @list
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end

end