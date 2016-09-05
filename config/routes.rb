Rails.application.routes.draw do
  root "static_pages#home"

  devise_for :users, controllers: {omniauth_callbacks: "users/callbacks"}


  resources :places, only: :show

  namespace :admin do
    root "places#new"
    resources :business_types
    resources :places, except: :show
  end
end
