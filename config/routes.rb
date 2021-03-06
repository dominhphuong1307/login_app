Rails.application.routes.draw do

  default_url_options :host => "example.com"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  # , only: [:new,:create,:show,:edit,:update,:]
  get 'signup' => 'users#create'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'help' => 'users#help'

  root 'users#welcome'
  get 'home' => 'users#welcome'
  get 'contact' => 'users#contact'
  get 'about' => 'users#about'
  get 'show/:id'  => 'users#show'

  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new,:create,:edit,:update]
  resources :microposts, only: [:create,:destroy]
end
