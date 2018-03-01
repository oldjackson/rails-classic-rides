Rails.application.routes.draw do
  get 'users/show'

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  root to: 'pages#home'
  resources :cars do
    resources :bookings, only: [:new, :create]
  end

  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
