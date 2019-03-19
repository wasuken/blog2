class CommentsController < ApplicationController
  def create()
    Comment.create(username: params["comment"]["username"],
                   comment: params["comment"]["comment"],
                   blog_id: params["comment"]["blog_id"])
  end
end
