Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :offers, only: [ :index, :show, :create, :destroy, :new] do
    resources :bookings, only: [:create, :update]
  end
  resources :bookings, only: :index
  namespace :owner do
    resources :bookings, only: :index
  end
  namespace :myoffers do
    resources :offers, only: :index
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
