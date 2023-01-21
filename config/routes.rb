Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:index, :show, :edit, :update]
  resources :games, only: [:index, :show, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :game_comments, only: [:create, :destroy]
  end
end
