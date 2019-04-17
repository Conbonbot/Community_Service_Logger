Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'supervisors/new'
  get 'supervisors/home'
  get 'supervisors/hours'

   get 'sessions/new'
   #get 'admin/home'
   
   root 'users#new'
   get    '/formA',      to: 'users#new'
   post   '/formA',      to: 'users#create'
   get    '/formB',      to: 'supervisors#new'
   get    '/new_hour',   to: 'hours#new'
   post   '/new_hour',   to: 'hours#create'
   get    '/hours',      to: 'users#hours'
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
   resources :supervisors, only: [:new, :create]
   resources :account_activation, only: [:edit]
   resources :hours, only: [:create]
   resources :password_resets, only: [:new, :create, :edit, :update]
   
end
