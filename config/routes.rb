Rails.application.routes.draw do
  get 'requests/index'

  get 'requests/show'

  get 'requests/new'

  get 'requests/create'

  get 'requests/edit'

  get 'requests/update'

  get 'requests/destroy'

  resources :jobs do
    resources :reviews, only: [:new, :create]
    resources :messages, only: [:new, :create]
    resources :requests, only: [:new, :create, :show, :delete]
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
