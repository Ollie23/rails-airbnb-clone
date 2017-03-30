Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bars do
    resources :events, only: [:new, :create, :destroy]
  end
  resources :events, only: [:index, :show]
end
