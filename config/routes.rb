Rails.application.routes.draw do
  root "artists#index"

  resources :artists, except: [:new, :edit, :create, :update]
end
