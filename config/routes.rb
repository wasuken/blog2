# coding: utf-8
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/api/v1/blogs', to: 'blogs#index_json'
  get '/api/v1/tags', to: 'blogs#tags'
  post '/api/v1/blog', to: 'blogs#post'
  get '/page/:id', to: 'blogs#page'
  get '/tags/', to: 'blogs#tags_page'
  get '/tag/:tag', to: 'blogs#tag_page'
  post '/comment', to: 'comments#create'
  get '/', to: 'blogs#index'
end
