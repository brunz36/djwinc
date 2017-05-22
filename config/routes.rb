Rails.application.routes.draw do
  root 'pages#landing'

  get 'store/index'

  get 'pages/education'
  get 'pages/splash'
  get 'pages/landing'

  get 'admin' => 'admin#index'

  controller :sessions do
    get    'login'  => :new
    post   'login'  => :create
    delete 'logout' => :destroy
  end

  resources :users
  resources :orders
  resources :line_items
  resources :carts

  # For my customers
  resources :items do
    resources :photos
  end

  # administrate those items
  namespace :admin do
    resources :items
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Shrine::DownloadEndpoint => "/attachments"
end
