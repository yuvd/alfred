Rails.application.routes.draw do

  get 'places/businesses'
  devise_for :users
  root to: 'pages#home'

get 'places/map', to: 'places#map', as: 'map'
get 'profile', to: 'users#index', as: 'profile'

resources :users, only: [:edit, :update]

  resources :places do
    resources :bookmarks, only: [:new, :create]
  end

  resources :categories
  resources :users, only: [:show] do
    resources :preferences
    resources :bookmarks, except: [:new, :create]
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
