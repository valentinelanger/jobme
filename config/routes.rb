Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :jobs do
    resources :reviews, only: [:new, :create]
    resources :messages, only: [:new, :create]
    resources :requests, only: [:new, :create, :show, :delete]
  end
  root to: 'pages#home'
end
