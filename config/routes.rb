Rails.application.routes.draw do
    root to: 'users#index'
    get '/' => 'users#index'
    get '/signin' => 'sessions#new'
    resources :users
    post '/sessions' => 'sessions#create'
    get '/sessions/destroy' => 'sessions#destroy'
    resources :attractions
    post '/rides' => 'rides#create'

end