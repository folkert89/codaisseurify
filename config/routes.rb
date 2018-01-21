Rails.application.routes.draw do
  root "artists#index"


  resources :artists, except: [:new, :edit, :create, :update] do
      resources :songs, except: [:edit, :update]
  end
end
