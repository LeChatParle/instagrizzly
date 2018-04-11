Rails.application.routes.draw do
  devise_for :users
  #resources creates the other routes like #edit #new etc
  resources :pics do
    resources :comments
  end

  root "pics#index"

  get "new", to: "pics#new"
end
