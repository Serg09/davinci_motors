Rails.application.routes.draw do
  # You can have the root of your site routed with "root"
  root 'cars#index'

  resources :cars
  # resources :cars do
  #   get :show, on: :collection
  # end
end
