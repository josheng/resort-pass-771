Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'users/profile', to: 'pages#show', as: :user_profile
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
