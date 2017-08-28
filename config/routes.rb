Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create]

  resources :mentors, only: [:index, :show] do
    resources :notifications, only: [:new, :create]
  end
  
  get 'users/:id', as: 'dashboard', to: 'users#show'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/slack/callback'
end
