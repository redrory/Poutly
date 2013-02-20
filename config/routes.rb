Poutly::Application.routes.draw do
  resources :users

  resources :sessions, only: [:new, :create, :destroy]
  resources :clients#, only:[:create, :destroy, :paid]

  root to: 'static_pages#home'

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete


  match '/help', to: 'static_pages#help'
  match '/contact', to: 'static_pages#contact'
  match '/about', to: 'static_pages#about'

  match '/clients', to: 'static_pages#show' 
  match '/paid', to: 'clients#paid'



end
