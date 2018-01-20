Rails.application.routes.draw do
  root "artists#index"

  resources :songs, except: [:edit, :update]
  resources :artists, except: [:new, :edit, :create, :update]
end
