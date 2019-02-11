# coding: utf-8
require 'blog.rb'

class BlogsController < ApplicationController
  protect_from_forgery :except => [:post]
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
  def tags
    # 登場回数順で登場回数付きのタグのJSONを返す。
    @all_tags = Blog.select(:tags_string).map{|v| v["tags_string"].split(' ')}.flatten
    render json: @all_tags
             .uniq
             .sort_by{|v| @all_tags.count(v)}
             .reverse
             .map{|v| {size: @all_tags.count(v), string: v}}
  end
  def post
    my_password = BCrypt::Password.create("my password")
    return if params[:password] == 
    @tags_string = params[:tags_string]
    @tags_string ||= create_tags_string_from_body(params[:body])
    @post = Blog.new(body: params[:body], title: params[:title], tags_string: @tags_string)
    @post.save
  end
end
