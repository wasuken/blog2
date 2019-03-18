class CommentsController < ApplicationController
  def create()
    @id = Comment.maximum(:id).nil? ? 1 : Comment.maximum(:id)
    @comment = Comment.new(id: @id
                           username: params["comment"]["username"],
                           comment:  params["comment"]["comment"],
                           blog_id:  params["comment"]["blog_id"])
    @comment.touch(:update_at)
    @comment.touch(:create_at)
    @comment.save
  end
end
