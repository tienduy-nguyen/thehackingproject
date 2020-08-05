Rails.application.routes.draw do
  root to: 'static_pages#home'

  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  get 'welcome/:first_name', to: 'static_pages#home'
  get 'welcome', to: 'users#new'
  post 'welcome', to: 'users#create'
  get 'user/first_name', to: 'users#show_by_first_name'


  resources :users, except: [:destroy] 

  resources :gossips do
    resources :comments
  end
  resources :tags

  resources :comments do
    resources :comments
  end


   # error pages
   %w( 404 422 500 503 ).each do |code|
    get code, :to => "errors#show", :code => code
  end
  
end

