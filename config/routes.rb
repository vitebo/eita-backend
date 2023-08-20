Rails.application.routes.draw do
  post 'user/create'
  post 'user/update'
  get 'feed/index'
  post 'content/classify'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
