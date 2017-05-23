Rails.application.routes.draw do
  get 'messages/index'

  get 'messages/new'

  get 'messages/create'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :jobs do
    resources :reviews, only: [:new, :create]
    resources :requests, only: [:new, :create, :show, :delete] do
      resources :messages, only: [:index, :new, :create]
    end
  end
  root to: 'pages#home'
end
