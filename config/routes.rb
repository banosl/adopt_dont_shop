Rails.application.routes.draw do
  root 'welcome#index'
  get '/', to: 'application#welcome'

  resources :applications, only: [:show, :new, :create, :update]

  resources :pets, only: [:index, :show, :edit, :update, :destroy]

  resources :shelters, only: [:index, :new, :create, :destroy, :show, :edit, :update]

  resources :application_pets, only: [:create]

  namespace :admin do
    resources :shelters, only: [:index]
    resources :applications, only: [:show, :update]
  end

  resources :veterinary_offices, only: [:index, :new, :show, :create, :edit, :update, :destroy]
  resources :veterinarians, only: [:index, :show, :edit, :update, :destroy]
end
