Rails.application.routes.draw do
  get '/' => 'feed#index'
  get '/bookmarks' => 'feed#bookmarks'
  post '/' => 'feed#bookmark', as: 'bookmark'
  get '/entries' => 'feed#entries'
end
