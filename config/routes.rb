Rails.application.routes.draw do
  devise_for :users
  # For details onroot 'posts#top'
  get '/posts/about' => 'posts#about'
  resources :posts, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show ,:edit, :update, :index]
  get '/' => 'posts#top'
end
