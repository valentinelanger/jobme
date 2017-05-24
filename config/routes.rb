Rails.application.routes.draw do

  get 'messages/conversations'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:show]

  resources :jobs do
    resources :reviews, only: [:new, :create]
    resources :requests, only: [:new, :create, :show, :update, :destroy] do
      resources :messages, only: [:index, :new, :create]
    end
  end

  root to: 'pages#home'
end
