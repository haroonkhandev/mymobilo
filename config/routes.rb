Rails.application.routes.draw do
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
end
