Rails.application.routes.draw do

  root 'welcome#home'

  get '/auth/facebook/callback' => 'sessions#create'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get 'users', to: 'users#index', as: 'users'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, except: [:index]
  resources :sessions, only: [:new, :create, :destroy]



   
     resources :movies 
   
   resources :movies, only: [:show] do
    resources :comments
  end
    
  resources :directory, only: [:show]
  resources :genres

  post 'movies/:id/favorite', to: 'movies#favorite', as: 'favorite'
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
