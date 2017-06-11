Rails.application.routes.draw do
  root 'pages#landing'

  get 'store/index'

  get 'portfolio/index'

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
  resources :charges

  # For my customers
  resources :items do
    resources :photos
  end

  # administrate those items
  namespace :admin do
    resources :items
  end

  mount Shrine::DownloadEndpoint => "/attachments"
end
