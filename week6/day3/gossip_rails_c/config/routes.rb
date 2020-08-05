Rails.application.routes.draw do
  root to: 'static_pages#home'

  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  get 'welcome/:first_name', to: 'static_pages#home'
  get 'welcome', to: 'users#new'
  post 'welcome', to: 'users#create'


  resources :users, except: [:destroy] 
  resources :gossips
end

