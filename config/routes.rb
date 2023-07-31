Rails.application.routes.draw do
  resources :schedules
  devise_for :users
  resources :users
  resources :users, only: [:show]
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'foods/index' => 'foods#index'
  root 'foods#index'

  get 'foods/link' => 'foods#link'

end
