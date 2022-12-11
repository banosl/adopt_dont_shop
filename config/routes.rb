Rails.application.routes.draw do
  get '/', to: 'application#welcome'

  resources :applications, only: [:show, :new, :create, :update]

  resources :pets, only: [:index, :destroy, :show, :edit, :update]

  resources :shelters, only: [:index, :new, :create, :destroy, :show, :edit, :update]

  resources :application_pets, only: [:create]

  namespace :admin do
    resources :shelters, only: [:index]
  end
end
