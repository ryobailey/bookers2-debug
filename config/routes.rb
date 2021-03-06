Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
  resource :favorites, only: [:create, :destroy]
  resources :post_comments, only: [:create, :destroy]
end
  
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    get '/search', to: 'searches#search'
    get 'searches/search'
    end
  
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
end