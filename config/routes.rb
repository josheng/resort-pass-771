Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'users/profile', to: 'users#show', as: :user_profile
  get 'listings/search', to: 'listings#search', as: :search_listing
  get 'listings/filter', to: 'listings#filter', as: :filter_listing


  resources :listings, only: %i[index show]

  resources :listings, only: [] do
    resources :bookings, only: %i[create new]
    resources :reviews, only: %i[create new]
  end

  resources :bookings, only: %i[index show]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
