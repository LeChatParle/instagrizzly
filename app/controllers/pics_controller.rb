class PicsController < ApplicationController
  #before_action :authenticate_user!, except: [:index, :show]

  def index
    @pics = Pic.all.order('created_at DESC')
  end

  def new
    @pic = Pic.new
  end

  #creates post, and if successfull, goes to post
  def create
    @pic = Pic.new(pic_params)

    if @pic.save
      redirect_to @pic
    end
  end

  private
    def pic_params
      params.require(:pic).permit(:title, :description)
    end
end
