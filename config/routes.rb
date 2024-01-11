Rails.application.routes.draw do
  devise_for :users

  unauthenticated do
    root "home#index", as: :unauthenticated_root
  end

  authenticated :user do
    root "groups#index", as: :authenticated_root
  end

  resources :users do
    resources :groups do
      resources :entities
    end
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
