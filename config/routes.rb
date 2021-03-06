Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :cars, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:create, :new]
  end

  resources :bookings, only: [:edit, :update, :destroy] do
    resources :reviews, only: [:new, :create, :edit, :update]
  end

  get 'dashboard', to: 'bookings#dashboard', as: :dashboard
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
