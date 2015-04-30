Rails.application.routes.draw do
  root to: 'root#root'
  resources :users, only: [:new, :create, :destroy, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :listings
    resources :reviews
    resources :reservations
    resources :users
  end

end
