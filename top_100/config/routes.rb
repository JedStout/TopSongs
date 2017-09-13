Rails.application.routes.draw do
  devise_for :models
  resources :songs

  root 'songs#index'

end
