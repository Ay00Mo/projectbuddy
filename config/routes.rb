Rails.application.routes.draw do
  devise_for :users
  root "cases#index"
end
