Poutly::Application.routes.draw do
  resources :users

  root to: 'static_pages#home'

  match '/signup', to: 'users#new'

  match '/help', to: 'static_pages#help'
  match '/contact', to: 'static_pages#contact'
  match '/about', to: 'static_pages#about'


end
