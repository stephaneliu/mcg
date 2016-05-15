require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
