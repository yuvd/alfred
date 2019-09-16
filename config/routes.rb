Rails.application.routes.draw do
  get 'places/businesses'
  devise_for :users
  root to: 'pages#home'
  resources :places
  resources :user, only: [:show] do
    resources :bookmarks
    resources :preferences
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
