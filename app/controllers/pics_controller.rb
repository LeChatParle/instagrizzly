class PicsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_pic, only: [:show, :edit, :update, :destroy]

  def index
    @pics = Pic.all.order('created_at DESC')
  end

  def new
    @pic = Pic.new
  end

  def show
  end

  #creates post, and if successfull, goes to post
  def create
    @pic = Pic.new(pic_params)

    if @pic.save
      redirect_to @pic
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @pic.update(pic_params)
      redirect_to @pic
    else
      render 'edit'
    end
  end

  def destroy
    @pic.destroy
    redirect_to root_path
  end

  private
    def pic_params
      params.require(:pic).permit(:title, :description, :image)
    end

    def find_pic
      @pic = Pic.find(params[:id])
    end
end
