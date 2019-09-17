Rails.application.routes.draw do

  get 'places/businesses'
  devise_for :users
  root to: 'pages#home'
  
  resources :places do
    resources :bookmarks, only: [:new, :create]
  end
  resources :categories
  resources :user, only: [:show] do
    resources :preferences
    resources :bookmarks, except: [:new, :create]
  end
  
  get 'places/map', to: 'places#map', as: 'map'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
