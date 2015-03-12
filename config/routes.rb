Rails.application.routes.draw do
  root "static_pages#home"
  match '/signup', to: 'users#new', via: 'get'
  resources :users
end
