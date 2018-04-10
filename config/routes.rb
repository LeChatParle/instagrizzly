Rails.application.routes.draw do
  #resources creates the other routes like #edit #new etc
  resources :pics

  root "pics#index"

  get "new", to: "pics#new"
end
