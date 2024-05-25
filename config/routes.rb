Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "users#index"

  resources :users, only: [:new, :create] do
    resources :songs, only: [:index, :show, :new, :create]
  end
end
