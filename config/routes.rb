Rails.application.routes.draw do
  get 'sessions/new'

   root 'users#new'
   get    '/formA',  to: 'users#new'
   post   '/formA',  to: 'users#create'
   get    '/formB',  to: 'users#volunteer'
   get    '/formC',  to: 'users#hours'
   get    '/login',  to: 'sessions#new'
   post   '/login',  to: 'sessions#create'
   delete '/logout', to: 'sessions#destroy'
   resources :users
   
  
end
