Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'users/profile', to: 'users#show', as: :user_profile
  resources :listings, only: %i[show]

  get 'listings/search', to: 'listings#search', as: :search_listing
  get 'listings/filter', to: 'listings#filter', as: :filter_listing
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
