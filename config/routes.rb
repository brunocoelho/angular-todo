AngularTodo::Application.routes.draw do
  devise_for :users

  root to: 'todos#dashboard'

  get '/auth/:provider/callback', to: 'authentications#create'

  resources :todos
  resources :users
end
