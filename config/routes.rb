Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  get 'pages/education'

  get 'pages/splash'

  get 'pages/landing'

  root 'pages#landing'

  resources :items do
    resources :photos
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Shrine::DownloadEndpoint => "/attachments"
end
