Rails.application.routes.draw do

  get 'user/:id/index' => 'feed#index', as: 'index'
  get 'user/:id/bookmarks' => 'feed#bookmarks', as: 'bookmarks'
  post 'user/:id/index' => 'feed#bookmark', as: 'bookmark'
  get '/entries' => 'feed#entries'
  get '/' => 'user#signin'
  post '/login' => 'user#login'
end
