Poutly::Application.routes.draw do

  resources :users

  resources :sessions, only: [:new, :create, :destroy]
  resources :clients#, only:[:create, :destroy, :paid]
  resources :password_resets

  root to: 'static_pages#home'

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete


  match '/help', to: 'static_pages#help'
  match '/contact', to: 'static_pages#contact'
  match '/about', to: 'static_pages#about'
  match '/admin', to: 'static_pages#admin'

  match '/clients', to: 'static_pages#show' 
  match '/clients/:id/paid', to: 'clients#paid', :as => 'client_paid'
  match '/clients/:id/reminder', to: 'clients#reminder', :as => 'client_reminder'


end
