Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new,:create,:show]
  get 'signup' => 'users#create'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'help' => 'users#help'

  root 'users#welcome'
  get 'home' => 'users#welcome'
  get 'contact' => 'users#contact'
  get 'about' => 'users#about'
  get 'edit/:id'  => 'users#edit'
end
