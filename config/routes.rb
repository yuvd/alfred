Rails.application.routes.draw do

  get 'forums/index'
  get 'forums/show'
  get 'forums/edit'
  get 'forums/update'
  # get 'reviews/new'
  # get 'reviews/create'
  # get 'places/businesses'
  devise_for :users
  root to: 'pages#home'


  get 'places/map', to: 'places#map', as: 'map'
  get 'profile', to: 'pages#profile', as: 'profile'
  resources :places do
    resources :reviews, only: [:new, :create]
    resources :bookmarks, only: [:new, :create]
  end
  resources :categories
  # resources :user, only: [:show] do
  resources :bookmarks, except: [:new, :create]
  resources :preferences
  # end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
