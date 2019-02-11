Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'blogs#index'
  get '/page/:id', to: 'blogs#page'
  get '/api/v1/blogs', to: 'blogs#index_json'
  get '/api/v1/tags', to: 'blogs#tags'
  post '/api/v1/blog', to: 'blogs#post'
end
