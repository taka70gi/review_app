Rails.application.routes.draw do
  get 'homes/index'
  root 'dramas#index'
  get 'users/index'
  get 'dramas/index'
  get 'comments/index'
  get 'dramas/search' => 'dramas#search'

  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :dramas
  resources :comments
  resources :homes, only: [:index]
  resources :users, only: [:show, :edit, :update] do
    get :favorites, on: :collection
  end
  resources :dramas, expect: [:index] do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update] do
    get :likes, on: :collection
  end
  resources :comment, expect: [:index] do
    resource :likes, only: [:create, :destroy]
  end
  namespace :admin do
    resources :dramas, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end
end
