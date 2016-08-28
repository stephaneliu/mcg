Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  resources :users, only: [:index, :edit, :show, :update, :destroy]

  resource :dashboard, only: [:show]

  get '/.well-known/acme-challenge/:id' => 'pages#letsencrypt'
end
