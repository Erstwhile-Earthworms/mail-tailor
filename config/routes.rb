Rails.application.routes.draw do
  get 'users/new'
  match '/signup', to: 'users#new', via: 'get'
  root "static_pages#home"
end
