Rails.application.routes.draw do
  # Add users and todos routes
  namespace :api do
    namespace :v1 do
      resources :users
      resources :todos
    end
  end
end
