Rails.application.routes.draw do
  root to:'welcome#show'

  get 'team', to: 'team#show'
  get 'contact', to: 'contact#show'
  get 'welcome/:first_name', to: 'welcome#show'
  get 'gossips/:id', to: 'gossip#gossip', as:'gossip'

  get 'profile/:first_name', to: 'profile#profile', as: 'profile'
end
