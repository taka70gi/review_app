Rails.application.routes.draw do
  get 'favorites/index'
  get 'users/index'
  get 'dramas/index'
  get 'comments/index'
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :dramas
  resources :comments

  resources :users, only: [:show, :edit, :update] do
    get :favorites, on: :collection
  end
  resources :dramas, expect: [:index] do
    resource :favorites, only: [:create, :destroy]
  end
end
