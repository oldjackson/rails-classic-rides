Rails.application.routes.draw do

  devise_for :users, controllers: {
        registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks'
      }

  root to: 'pages#home'
  resources :cars do
    resources :bookings, only: [:new, :create]
  end

  get "/bookings/:id/accept", to: 'bookings#accept', as: 'accept'
  get "/bookings/:id/decline", to: 'bookings#decline', as: 'decline'

  resources :users, only: [:show]

  get "/dashboard", to: 'users#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
