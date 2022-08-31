Rails.application.routes.draw do
  resources :bookings
  resources :properties do
    member do
      get :owner_bookings
    end
  end

  get 'my_bookings', to:'bookings#my_bookings'
  get 'allprop', to:'properties#allprop'
  # get 'property bookings', to:'bookings#owner_booking'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html9
  # Defines the root path route ("/")
  root "homes#index"
end
