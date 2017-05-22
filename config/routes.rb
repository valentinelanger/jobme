Rails.application.routes.draw do
  resources :jobs do
    resources :reviews, only: [:new, :create]
    resources :messages, only: [:new, :create]
    resources :requests, only: [:new, :create, :show, :delete]
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
