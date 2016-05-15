require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  resources :users, only: [:index, :show, :update, :destroy]

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
