Rails.application.routes.draw do
  get 'users/index'
  get 'dramas/index'
  get 'comments/index'
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :dramas
  resources :comments
end
