Rails.application.routes.draw do


 # get 'sessions/new'
  #path :cheminrelative
  #url:chemincomplet
  
  root 'pages#home'
  get 'aide'=>'pages#aide'
  get 'contact'=>'pages#contact'
  get 'inscription'=>'utilisateurs#new'

  resources :utilisateurs
   get 'login'=>'sessions#new'
   post 'login'=>'sessions#create'
   delete 'logout'=>'sessions#destroy'
   resources :articles, only:[:create,:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
