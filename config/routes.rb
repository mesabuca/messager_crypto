Rails.application.routes.draw do
  post 'emails/random_mails', to: 'emails#five_random_mail'
  get 'emails/compare', to: 'emails#mails_compare'
  resources :emails do
    get 'decrypt', to: 'emails#decrypt'
    get 'rsa_public_verify', to: 'emails#rsa_public_verify'
  end
  get 'sms_verification', to: 'sms_verification#index'
  post 'sms_verification', to: 'sms_verification#submit'


  get 'dashboards/index'
  get 'dashboards/show'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  root to: 'emails#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
