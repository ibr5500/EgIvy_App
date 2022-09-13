Rails.application.routes.draw do
  devise_for :users

  root "groups#index"
  
  resources :groups, only: [:index, :show] do
    resources :entities, only: [:index, :show]
  end
end
