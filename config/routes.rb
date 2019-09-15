Rails.application.routes.draw do
  get 'bookmarks/index'
  get 'bookmarks/show'
  get 'bookmarks/new'
  get 'bookmarks/create'
  get 'bookmarks/update'
  get 'bookmarks/edit'
  get 'bookmarks/delete'
  devise_for :users
  root to: 'pages#home'
  resources :user, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
