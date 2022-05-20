Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  resources :users , only: [:show] do
    resources :posts , only: [:index,:show ,:new, :create]
  end
end
