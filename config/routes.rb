Rails.application.routes.draw do
  post 'emails/random_mails', to: 'emails#five_random_mail'
  get 'emails/compare', to: 'emails#mails_compare'
  resources :emails do
    get 'decrypt', to: 'emails#decrypt'
  end
  get 'dashboards/index'
  get 'dashboards/show'
  devise_for :users
  root to: 'emails#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
