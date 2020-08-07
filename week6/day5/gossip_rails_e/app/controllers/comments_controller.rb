class CommentsController < ApplicationController
  include SessionsHelper
  
  before_action :logged_in_user

  # GET comments/new
  def new
    @comment = Comment.new
  end

  def create
    @commentable.comments.build(comment_params)
    @commentable.save
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_commentable
    if params[:comment_id]
      @commentable = Comment.find_by_id(params[:comment_id]) or not_found
    elsif params[:post_id]
      @commentable = Post.find_by_id(params[:post_id]) or_not_found
    end
  end

end
