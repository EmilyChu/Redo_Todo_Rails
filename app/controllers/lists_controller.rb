class ListsController < ApplicationController

  def index
    @list = List.all
  end

  def new
    @list = List.new
  end

  def create
    list_params = params[:list]
    @list = List.create! name: list_params[:name]
    if @list.save
      redirect_to lists_path(@list)
    else
      render :new
    end 
  end

end