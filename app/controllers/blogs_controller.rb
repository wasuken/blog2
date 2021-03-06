# coding: utf-8
require 'blog.rb'

class BlogsController < ApplicationController
  protect_from_forgery :except => [:post]
  def index
    @lasted_comments = Comment.order('created_at DESC').take(10)
    @blog_all = Blog.order("id DESC")
    @blog_img_path = view_context.image_path('blog.jpg')
    @profile_path = view_context.image_path('ninja.png')
    @title = "重荷怠惰iary"
    render "blogs/index"
  end
  def page
    @id = params[:id]
    @comments = Comment.where("blog_id = ?", @id).all
    @comment = Comment.new
    @blog = Blog.where(id: @id).first
    @title = @blog.title
    render "blogs/page"
  end
  def index_json
    @blog_all = Blog.order("created_at DESC")
    @blog = { blog_default_img_path: view_context.image_path('blog.jpg'),
              blogs: @blog_all }
    render json: @blog
  end
  def tags
    @title = "重荷怠惰iary"
    # 登場回数順で登場回数付きのタグのJSONを返す。
    @all_tags = Blog.select(:tags_string).map{|v| v["tags_string"].split(' ')}
                  .flatten
    render json: @all_tags
             .uniq
             .sort_by{|v| @all_tags.count(v)}
             .reverse
 n            .map{|v| {size: @all_tags.count(v), string: v}}
  end
  def tags_page
    @title = "重荷怠惰iary"
    @tags = Blog.select(:tags_string).map{|v| v["tags_string"].split(' ')}
              .flatten
    @tags = @tags
              .sort
              .reverse
              .uniq
    render "blogs/tags"
  end
  def tag_page
    @title = "重荷怠惰iary"
    @blog_all = Blog.where("tags_string like ?", "%#{params[:tag]}%")
    render "blogs/tag"
  end
  def post
    is_pwd = User.where("name = ?",params[:user])
               .first.authenticate(params[:password])
    return unless is_pwd
    @tags_string = params[:tags_string]
    # @tags_string ||= Blog.create_tags_string_from_body(params[:body])
    @post = Blog.new(body: params[:body], title: params[:title],
                     tags_string: @tags_string)
    if @post.tags_string.nil?
      @post.tags_string = @post.create_tags_string_from_body(@post.body)
    end
    @post.save
  end
  def create
  end
  def delete
    is_pwd = User.where("name = ?",params[:user])
               .first.authenticate(params[:password])
    return unless is_pwd
    Blog.find(params[:id]).delete
  end
end
