Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, :controllers => { registrations: "registrations"}
  root to: 'pages#home'
resources :profiles

  resources :bars do
    resources :events, only: [:new, :create, :destroy]
  end

  resources :events, only: [:index, :show, :edit, :update]

  resources :events do
   post 'attend', on: :member
  end

end
