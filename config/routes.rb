Rails.application.routes.draw do
  root to: 'sessions#new'

  resources :conversations do
    resources :messages
  end

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/user' => 'users#show'
  delete '/user' => 'users#destroy'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  mount ActionCable.server => '/cable'

end
