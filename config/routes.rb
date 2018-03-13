Rails.application.routes.draw do
  namespace :api do
    resources :users
    resources :posts
    resources :apidocs, only: [:index]

    post 'authenticate', to: 'authentication#authenticate'
  end

  get '/api' => redirect('/swagger/dist/index.html?url=/api/apidocs.json')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
