Rails.application.routes.draw do
  resources :comments
  devise_for :users

  # devise_scope :user do
  #   authenticated :user do
  #     root :to => 'posts#index'
  #   end
  #   unauthenticated :user do
  #     root :to => 'devise/registrations#new', as: :unauthenticated_root
  #   end
  # end

  resources :users
  resources :posts do
    resources :comments
  end

  root :to => 'posts#index'
end
