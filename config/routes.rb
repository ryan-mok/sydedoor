Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

<<<<<<< HEAD
  root 'static_pages#home'
  get 'static_pages/home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users

=======
  get 'static_pages/home'

  root 'application#hello'
>>>>>>> Use dynamic page titles in layout
end
