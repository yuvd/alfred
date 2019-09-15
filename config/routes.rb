Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :user, only: [:show]
  resources :preferences
  resources :bookmarks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
