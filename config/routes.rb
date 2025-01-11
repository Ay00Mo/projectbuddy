Rails.application.routes.draw do
  devise_for :users
  root to: "cases#index"
  
  resources :users, only: [:show, :edit, :update]
  resources :contacts, only: [:new, :create]
  resources :attorney_firms, only: [:new, :create]
  resources :applicants, only: [:new, :create]
  resources :procedures, only: [:new, :create]

  resources :cases, only: [:index, :new, :create, :show, :edit, ] do
    collection do
      get 'search_form', as: :search_form  # 検索フォームページ
      get 'search_results', as: :search_results # 検索結果ページ
    end
  end  
end

