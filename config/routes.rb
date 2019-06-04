Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show', as: 'forecast'
      get "/backgrounds", to: "backgrounds#show"
      get '/road_trip', to: 'road_trip#show'
    end
  end
end
