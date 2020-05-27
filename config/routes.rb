Rails.application.routes.draw do
  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'login_guest', to: 'sessions#guest'
  delete 'logout', to: 'sessions#destroy'
  post 'message', to: 'messages#create'
  get 'registration', to: 'registration#new'
  post 'registration', to: 'registration#new'
  get 'newAccount', to: 'registration#index'
  post 'newAccount', to: 'registration#newAccount'
  resources :registration


  mount ActionCable.server, at: '/cable'
end
