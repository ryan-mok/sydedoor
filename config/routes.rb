Rails.application.routes.draw do
  get 'sessions/new'

  get 'companies/select_company', to: 'companies#select_company'
  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :companies do
    get :autocomplete_company_name, :on => :collection
  end
  resources :reviews do
    get :autocomplete_company_name, :on => :collection
  end
end
