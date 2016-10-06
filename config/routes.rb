Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :users
  resources :contacts
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

end
