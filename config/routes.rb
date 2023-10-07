Rails.application.routes.draw do
  root 'landings#index'
  get 'specifications/index'
  get 'specifications/show'
  get 'sub_categories/index'
  get 'sub_categories/show'
  get 'categories/show'

  get '/categories/index', to: 'categories#index'
  get '/categories/:category_id/subcategories', to: 'categories#subcategories'
  get '/subcategories/:subcategory_id/products', to: 'categories#products'
  
  devise_scope :user do
    get 'users/sessions/sign_out'
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
        sessions: 'users/sessions'

      }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products
end
