Rails.application.routes.draw do
  devise_for :users
  root to: 'questions#index'
  resources :questions do
    resources :bokes, only: :create do
      resources :likes, only: [:create, :destroy]
    end
  end
  resources :users, only: :show
end
