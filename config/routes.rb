Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create]

  get 'users/:id', as: 'dashboard', to: 'users#show'
  get 'mentors', as: 'mentors', to: 'mentors#index'
  get 'mentors/:id', as: 'mentor', to: 'mentors#show'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
