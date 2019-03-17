class CommentsController < ApplicationController
  def post
    @page_id = params[:page_id]
    @comment = params[:comment]
    return if params[:page_id].nil? || params[:comment].nil?
    @post = Comment.new(comment: params[:comment], page_id: params[:page_id])
    @post.save
    redirect_to :back
  end
end
