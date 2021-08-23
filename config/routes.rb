Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/home',    to: 'static_pages#home', as: 'home'
  get 'sessions/new'
  get 'users/new'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :posts,          only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
