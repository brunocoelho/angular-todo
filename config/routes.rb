AngularTodo::Application.routes.draw do
  root to: 'todos#dashboard'
  resources :todos
end
