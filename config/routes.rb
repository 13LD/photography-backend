Rails.application.routes.draw do
  namespace :api do
    resources :contacts

    resources :equipment
    resources :service_items
    resources :services
    resources :auth_tokens
    resources :users
    resources :posts
    resources :photos
    resources :comments
    resources :tags
    resources :apidocs, only: [:index]
    post 'download_image', to: 'posts#download_image'
    post 'authenticate', to: 'authentication#authenticate'
    delete 'logout', to: 'authentication#logout'
  end

  get '/api' => redirect('/swagger/dist/index.html?url=/api/apidocs.json')
end
