class PicsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pics = Pic.all.order('created_at DESC')
  end

  def new
    @pic = Pic.new
  end

  #creates post, and if successfull, goes to post
  def create
    @pic = Pic.new(pic_params);

    if @pic.save
      redirect_to @pic
    else
      render 'new'
    end
  end
end
