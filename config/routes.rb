Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#top'
  get '/posts/about' => 'posts#about'
  resources :posts, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show ,:edit, :update, :index]
  get '/' => 'posts#top'
end
