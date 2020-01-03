Rails.application.routes.draw do
  devise_for :users
  root to: 'questions#index'
  get 'ranking/likesorder'

  resources :questions do
    get 'showlikesorder/showlikesorder'
    resources :bokes, only: :create do
      resources :likes, only: [:create, :destroy]
    end
  end
  resources :users, only: :show
end
