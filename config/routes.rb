Rails.application.routes.draw do
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

  get '/shelters/:shelter_id/pets', to: 'shelters#pets'
  get '/shelters/:shelter_id/pets/new', to: 'pets#new'
  post '/shelters/:shelter_id/pets', to: 'pets#create'

  get '/veterinary_offices/:veterinary_office_id/veterinarians', to: 'veterinary_offices#veterinarians'
  get '/veterinary_offices/:veterinary_office_id/veterinarians/new', to: 'veterinarians#new'
  post '/veterinary_offices/:veterinary_office_id/veterinarians', to: 'veterinarians#create'
end
