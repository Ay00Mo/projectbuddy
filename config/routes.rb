Rails.application.routes.draw do
  devise_for :users
  root to: "cases#index"
  
  resources :users, only: [:show, :edit, :update]
  resources :contacts, only: [:new, :create]
  resources :attorney_firms, only: [:new, :create]
  resources :applicants, only: [:new, :create]
  resources :procedures, only: [:new, :create]

  resources :cases, only: [:index, :new, :create, :show] do
    collection do
      get 'search' # 検索アクションのルート
    end
  end
end

