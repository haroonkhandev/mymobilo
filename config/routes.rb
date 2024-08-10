Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'compare_products/index'
  get '/compare_products/compare'
  root 'landings#index'
  get 'specifications/index'
  get 'specifications/show'
  get 'categories/index'
  get 'categories/show'

  get '/categories/index', to: 'categories#index'
  get '/categories/:category_id/subcategories', to: 'categories#subcategories'

  resources :article_categories, only: [:index, :show]
  resources :articles, only: [:index, :show]
  
  devise_scope :user do
    get 'users/sessions/sign_out'
  end
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
        sessions: 'users/sessions'

      }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products do
    resources :comments
  end
end
