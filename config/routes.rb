Rails.application.routes.draw do
  resources :emails do
    get 'decrypt', to: 'emails#decrypt'
  end
  get 'emails/new'
  get 'dashboards/index'
  get 'dashboards/show'
  devise_for :users
  root to: 'emails#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
