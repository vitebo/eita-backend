Rails.application.routes.draw do
  get 'content/like'
  get 'content/deslike'
  get 'user/create'
  get 'feed/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
