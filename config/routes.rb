Rails.application.routes.draw do
  get 'supervisor/home'

   get 'sessions/new'
   #get 'admin/home'
   
   root 'users#new'
   get    '/formA',      to: 'users#new'
   post   '/formA',      to: 'users#create'
   get    '/formB',      to: 'supervisor#home'
   get    '/formC',      to: 'users#hours'
   get    '/admin',      to: 'admin#home'
   get    '/freshmen',   to: 'admin#freshmen'
   get    '/sophomores', to: 'admin#sophomores'
   get    '/juniors',    to: 'admin#juniors'
   get    '/seniors',    to: 'admin#seniors'
   get    '/charts',     to: 'admin#charts'
   get    '/login',      to: 'sessions#new'
   post   '/login',      to: 'sessions#create'
   delete '/logout',     to: 'sessions#destroy'
   resources :users
   resources :admin
   resources :supervisor
   resources :account_activation, only: [:edit]
   
end
