class CommentsController < ApplicationController
  #This prevents comments except from logged in users
  before_action :authenticate_user!

  #creates a comment and attaches it to the post, the goes to post
  def create
   @pic = Pic.find(params[:pic_id])
   @comment = @pic.comments.create(params[:comment].permit(:name, :body))

   redirect_to post_path(@pic)
  end

  #deletes comments by post and comment id, then goes to post
  def destroy
   @pic = Pic.find(params[:pic_id])
   @comment = @pic.comments.find(params[:id])
   @comment.destroy
   redirect_to post_path(@pic)
  end
end
