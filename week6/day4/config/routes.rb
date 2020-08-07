Rails.application.routes.draw do
  root to: 'static_pages#home'

  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  get 'welcome/:first_name', to: 'static_pages#home'
  get 'welcome', to: 'users#new'
  post 'welcome', to: 'users#create'
  get 'user/first_name', to: 'users#show_by_first_name'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  patch '/users/:id/edit', to: 'users#update_profile'
  get '/users/:id/setting', to: 'users#settings', as: "edit_user_settings"
  post '/users/:id/setting', to: 'users#settings'


  resources :users, except: [:destroy] 
  
  resources :gossips do
    resources :comments
    resources :likes
  end
  resources :tags

  resources :comments do
    resources :comments
    resources :likes
  end


   # error pages
   %w( 404 422 500 503 ).each do |code|
    get code, :to => "errors#show", :code => code
  end
  
end

