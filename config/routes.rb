Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:index, :show, :edit, :update]
  resources :games, only: [:index, :show, :create, :destroy] do
    resources :game_comments, only: [:create, :destroy]
  end
end
