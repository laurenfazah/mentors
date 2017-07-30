Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create]

  get 'users/:id', as: 'dashboard', to: 'users#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
