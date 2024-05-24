Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users do
    resources :songs, only: [:index, :show]
  end
end
