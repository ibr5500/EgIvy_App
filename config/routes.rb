Rails.application.routes.draw do
  devise_for :users

  unauthenticated :users do
    root "users#home"
  end

  authenticated :users do
    #get "/home", to: "groups#index", as: "home"
    #root 'groups#index', as: ''
  end

  resources :home, controller: :groups, only: [:index]

  resources :users do
    resources :groups, :path => 'categories', only: [:index, :show, :new, :create, :destroy] do
      resources :entities, :path => 'transactions', only: [:new, :create, :destroy]
    end
  end
end
