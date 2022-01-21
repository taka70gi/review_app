Rails.application.routes.draw do
  get 'dramas/index'
  devise_for :users
  root 'comments#index'
  get 'comments/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
