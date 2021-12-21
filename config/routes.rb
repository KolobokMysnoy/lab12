Rails.application.routes.draw do
  root 'ind#main'
  get 'ind/main'
  get 'ind/view'
  get 'session/login'
  post 'session/create'
  get 'session/logout'
  resources :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
