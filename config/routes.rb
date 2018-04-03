Rails.application.routes.draw do
  resources :tags
  namespace :api do
    resources :auth_tokens
    resources :users
    resources :posts
    resources :comments
    resources :apidocs, only: [:index]
    post 'download_image', to: 'posts#download_image'
    post 'authenticate', to: 'authentication#authenticate'
    delete 'logout', to: 'authentication#logout'
  end

  get '/api' => redirect('/swagger/dist/index.html?url=/api/apidocs.json')
end
