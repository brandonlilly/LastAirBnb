Rails.application.routes.draw do
  root to: 'root#root'
  resources :users, only: [:new, :create, :destroy, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]

end
