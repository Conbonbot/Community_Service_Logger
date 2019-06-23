Rails.application.routes.draw do

  get 'supervisor_password_resets/new'

  get 'supervisor_password_resets/edit'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'supervisors/new'
  get 'supervisors/home'
  get 'supervisors/hours'

   get 'sessions/new'
   #get 'admin/home'
   
   root 'users#new'
   get    '/formA',              to: 'users#new'
   post   '/formA',              to: 'users#create'
   get    '/formB',              to: 'supervisors#new'
   get    '/new_hour',           to: 'hours#new'
   post   '/new_hour',           to: 'hours#create'
   get    '/hours',              to: 'users#hours'
   get    '/formC',              to: 'users#hours'
   get    '/admin',              to: 'admin#home'
   get    '/freshmen',           to: 'admin#freshmen'
   get    '/sophomores',         to: 'admin#sophomores'
   get    '/juniors',            to: 'admin#juniors'
   get    '/seniors',            to: 'admin#seniors'
   get    '/charts',             to: 'admin#charts'
   get    '/login',              to: 'sessions#pre'
   get    '/user_login',         to: 'sessions#new'
   post   '/user_login',         to: 'sessions#create'
   get    '/user_logout',        to: 'sessions#destroy'
   delete '/user_logout',        to: 'sessions#destroy'
   get    '/supervisors',        to: 'users#all_supervisors'
   get    '/supervisor_login',   to: 'sessions#new_sup'
   post   '/supervisor_login',   to: 'sessions#create_sup'
   get    '/supervisor_logout',  to: 'sessions#destroy_sup'
   delete '/supervisor_logout',  to: 'sessions#destroy_sup'
   get    '/yes/:id',            to: 'supervisors#yes', :as => :new_yes_with_parameter
   get    '/no/:id',             to: 'supervisors#no', :as => :new_no_with_parameter
   resources :users
   resources :admin
   resources :supervisors
   resources :account_activation do
       member do
           get "sup_edit"
       end
   end
   resources :account_activation, only: [:edit, :sup_edit]
   resources :hours, only: [:create]
   resources :password_resets, only: [:new, :create, :edit, :update]
   resources :supervisor_password_resets, only: [:new, :create, :edit, :update]
   
end
