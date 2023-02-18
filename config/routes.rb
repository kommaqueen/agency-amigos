Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get "myaccount", to: "pages#myaccount"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :celebrities do
    resources :bookings, only: [:new, :create, :show]
    resources :reviews, except: [:destroy, :edit, :update]
  end

  resources :bookings, only: [:destroy]
  resources :reviews, only: [:destroy]
end
