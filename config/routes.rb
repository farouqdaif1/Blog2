Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users , only: [:users,:show] do
    resources :posts , only: [:index,:show ,:new, :create] do
      resources :comments , only: [:new, :create] 
      resources :likes , only: [:new, :create] 
    end
  end
end
