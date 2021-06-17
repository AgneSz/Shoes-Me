Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'about', to: 'pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :outfits do
    resources :shoes, only: [:new, :create, :edit, :update]
    resources :feedbacks, only: [:create, :update]
  end

  resources :shoes, only: [:destroy] do
    # like method in shoes controller
    member do
      put "like" => "shoes#like"
    end
    resources :wishes, only: :create
  end

  resources :feedbacks, only: [:destroy]
  resources :users, only: [:show]

  get "trending", to: "outfits#trending"
end
