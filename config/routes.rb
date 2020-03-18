Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
   delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  root to: 'pages#home'

  resources :projects, only: [:index, :show, :new, :create, :destroy] do
    resources :reports, only: [:index, :new, :create]
  end

  resource :trello_webhooks, only: %i(show create), defaults: { formats: :json }
  resources :clients, only: [:index, :new, :create]
  # For the background jobs
  require "sidekiq/web"
  authenticate :user, lambda { |u| true } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
