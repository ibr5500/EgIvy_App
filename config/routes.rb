Rails.application.routes.draw do
  devise_for :users

  unauthenticated :users do
    root "users#index"
  end

  authenticated :users do
    root 'groups#index', as: :authenticated_root
  end

  resources :users do
    resources :groups, only: [:index] do
      resources :entities, only: [:index]
    end
  end
end
