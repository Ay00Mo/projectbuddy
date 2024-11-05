Rails.application.routes.draw do
  devise_for :users
  root to: "cases#index"
  resources :users, only: [:show, :edit, :update]
end
