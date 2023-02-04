Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root to: 'homes#top'
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  resources :users, only: [:index, :show, :edit, :update]
  resources :games, only: [:index, :show, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :game_comments, only: [:create, :destroy]
  end
end
