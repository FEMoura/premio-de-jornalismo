Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :users
  # devise_scope :user do
  #   authenticated :user do
  #     root :to => 'public#index', as: :authenticated_root
  #   end
  #   unauthenticated :user do
  #     root :to => 'devise/sessions#new', as: :unauthenticated_root
  #   end
  # end
  namespace :restrict do
    resources :proposals
    root 'proposals#index'
  end
  root to: 'public#index'

end
