Rails.application.routes.draw do
  devise_for :users

  unauthenticated :users do
    root "users#home"
  end

  authenticated :users do
    root 'groups#index', as: ''
  end

  resources :groups, only: [:index]

  resources :users do
    resources :groups, only: [:index, :new, :show] do
      resources :entities, only: [:index]
    end
  end
end
