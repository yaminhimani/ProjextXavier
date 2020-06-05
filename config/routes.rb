Rails.application.routes.draw do
  root 'chatroom#index'
  
  #Session controller 
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'create_login'
  get 'login_guest', to: 'sessions#guest', as: 'login_guest'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  #Messages controller
  post 'message', to: 'messages#create', as: 'message'
  get '/messages/:user_1/:user_2', to: 'messages#messages', as: 'messages'
  
  #Registration controller
  get 'registration', to: 'registration#new'
  post 'registration', to: 'registration#new'
  get 'newAccount', to: 'registration#index'
  post 'newAccount', to: 'registration#newAccount'
  
  resources :registration


  mount ActionCable.server, at: '/cable'
end
