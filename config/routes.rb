Rails.application.routes.draw do
  devise_for :users
  #resources creates the other routes like #edit #new etc
  resources :pics

  root "pics#index"

  get "new", to: "pics#new"
end
