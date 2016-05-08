Rails.application.routes.draw do

  root                      'static_pages#home'
  get    'contact'       => 'static_pages#contact'
  get    'signup'        => 'users#new'
  get    'quotes/add'    => 'quotes#new'
  get   'quotes/like'    => 'quotes#like'
  get   'quotes/unlike'  => 'quotes#unlike'
  get    'login'         => 'sessions#new'
  post   'login'         => 'sessions#create'
  delete 'logout'        => 'sessions#destroy'

  resources :users
  resources :quotes
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

end
