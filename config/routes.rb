Rails.application.routes.draw do

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  root to: 'pages#home'
  resources :cars do
    resources :bookings, only: [:new, :create]
  end

  resources :users, only: [:show]
  get "/dashboard", to: 'users#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
