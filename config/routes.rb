Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  get 'messages/conversations'
  get 'users/requests'
  get 'users/missions'
  get 'users/profile_edit'
  put 'users/profile_update'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:show]

  resources :jobs do
    resources :reviews, only: [:new, :create]
    resources :requests, only: [:new, :create, :show, :destroy] do
      resources :messages, only: [:index, :new, :create]
    end
  end

  resources :requests, only: [:edit, :update]

  root to: 'pages#home'
end

