Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :forecast, only: :index
      get '/backgrounds', to: 'backgrounds#search'
      resources :users, only: :create 
      resources :session, only: :create
      resources :road_trip, only: :create
      resources :munchies, only: :index
    end
  end
end
