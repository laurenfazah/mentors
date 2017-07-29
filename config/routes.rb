Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create]

  get 'users/:id', as: 'dashboard', to: 'users#show'
end
