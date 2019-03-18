class CommentsController < ApplicationController
  def create()
    @id = 1
    if Comment.maximum(:id).nil?
      @id = Comment.maximum(:id)
    end
    Comment.create(id: @id,
                   username: params["comment"]["username"],
                   comment: params["comment"]["comment"],
                   blog_id: params["comment"]["blog_id"])
  end
end
