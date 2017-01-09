Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions', passwords: 'users/passwords' }
  resources :users
  resources :contacts
  namespace :sindjornal do
    root 'journalists#index'
    resources :journalists
  end
  namespace :admin do
    resources :newsletters
    root 'newsletters#index'
  end
  namespace :restrict do
    devise_scope :user do
      authenticated :user do
        root :to => 'proposals#index', as: :authenticated_root
      end
      unauthenticated :user do
        root :to => 'devise/sessions#new', as: :unauthenticated_root
      end
    end
    resources :proposals
    root 'proposals#index'
  end
  root to: 'public#index'
  get '/capacitacao/:training_id', to: 'public#training'
  get '/verify_journalist/:cpf', to: 'sindjornal/journalists#verify_journalist'

end
