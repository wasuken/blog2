class BlogsController < ApplicationController
  def index
    @title = "hello world"
    render "blogs/index"
  end
  def page
    @id = params[:id]
    @blog = Blog.where(id: @id).first
    render "blogs/page"
  end
  def index_json
    @blog = { blog_default_img_path: view_context.image_path('blog.jpg'), blogs: Blog.all}
    render json: @blog
  end
end
