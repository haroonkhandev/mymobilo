Rails.application.routes.draw do
  get 'specifications/index'
  get 'specifications/show'
  get 'sub_categories/index'
  get 'sub_categories/show'
  get 'categories/index'
  get 'categories/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  root 'main#index'
  get 'main/product'
  get 'main/store'
  get 'main/checkout'
  get 'main/sub_category'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products
end
