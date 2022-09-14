Rails.application.routes.draw do
  devise_for :users

  root "groups#index"
  
  resources :users do
    resources :groups, only: [:index] do
      resources :entities, only: [:index]
    end
  end
end
