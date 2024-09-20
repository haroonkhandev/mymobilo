Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'landings#index'
  get 'compare_products/index'
  get '/compare_products/compare'
  get 'specifications/index'
  get 'specifications/show'
  get 'categories/index'
  get 'categories/show'
  get '/categories/index', to: 'categories#index'
  get '/categories/:category_id/subcategories', to: 'categories#subcategories', as: 'subcategories'

  resources :article_categories, only: [:index, :show]
  resources :articles, only: [:index, :show]
  
  devise_scope :user do
    get 'users/sessions/sign_out'
    get 'users/cancel_account', to: 'devise/registrations#cancel_account', as: 'cancel_account'
  end

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
  }


  # Defines the root path route ("/")
  # root "articles#index"
  resources :products do
    collection do
      get :all_products
    end

    resources :comments
    member do
      post :favorite, to: 'favorites#create'
      delete :unfavorite, to: 'favorites#destroy'
    end
  end
  resources :favorites, only: [:index]
  # Restricted access for shopkeeper profiles
  namespace :users do
    get 'dashboard', to: 'dashboard#index'
  end

  namespace :shopkeepers do
    get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  end

  resources :shopkeeper_shops do
    get 'search_product', on: :member
    post 'add_to_shop', on: :member
    post 'remove_to_shop', on: :member
    get 'user_shops', on: :member
    post 'rate', on: :member
  end
  # Root path redirection based on role
  authenticated :user do
    root to: 'users/dashboard#index', as: :authenticated_user_root
  end

  authenticated :shopkeeper do
    root to: 'shopkeepers/dashboard#index', as: :authenticated_shopkeeper_root
  end

  unauthenticated do
    root to: 'landings#index', as: :unauthenticated_root
  end
end
