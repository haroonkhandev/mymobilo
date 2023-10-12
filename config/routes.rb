Rails.application.routes.draw do
  root 'landings#index'
  get 'specifications/index'
  get 'specifications/show'
  get 'categories/index'
  get 'categories/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
        sessions: 'users/sessions'

      }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products
end
