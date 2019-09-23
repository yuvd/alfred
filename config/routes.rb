Rails.application.routes.draw do

  # get 'reviews/new'
  # get 'reviews/create'
  # get 'places/businesses'

  root to: 'pages#home'
  devise_for :users, controllers: { registrations: "registrations" }

  resources :posts, only: [:edit, :update, :destroy] do
    resources :post_votes, only: [:create]
  end
  resources :post_votes, only: [:destroy]
  resources :forums, only: [:index, :show] do 
    resources :posts, only: [:new, :create]
  end
  get 'places/map', to: 'places#map', as: 'map'
  get 'profile', to: 'pages#profile', as: 'profile'
  resources :places do
    resources :reviews, only: [:new, :create, :index]
    resources :bookmarks, only: [:new, :create]
    resources :forums, only: [:create]
  end
  resources :categories
  # resources :user, only: [:show] do
  resources :bookmarks, except: [:new, :create]
  resources :users, only: [:update] do
    resources :preferences
  end
  # end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
