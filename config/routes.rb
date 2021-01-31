Rails.application.routes.draw do
  # get "todos", to: "todos#index"
  # post "todos/create", to: "todos#create"
  # get "todos/:id", to: "todos#show"
  resources :todos
  post "/users/login", to: "users#login"
  resources :users
  root to: 'pages#main'
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
 end
