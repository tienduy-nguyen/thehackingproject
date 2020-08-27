Rails.application.routes.draw do
  get 'emails/index'
  devise_for :users
  root to: "home#index"
  resources :tasks, except: [:show]
  resources :emails
end
