class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @list = List.all
  end

  def new
    @list = List.new
  end
  
  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)  #List.new(params.require(:name))
    if @list.save
      flash[:notice]="List created successfully!"
      redirect_to @list
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
  end
 
  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      flash[:notice]="List updated successfully!"
      redirect_to @list
    else
      render 'edit'
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end

end