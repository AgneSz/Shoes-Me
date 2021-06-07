Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :outfits do
    resources :shoes, only: [:new, :create, :edit, :update]
  end

  resources :shoes, only: [:destroy] do 
    resources :feedback, only: [:create, :update]
  end

  resources :feedback, only: [:destroy]
end
