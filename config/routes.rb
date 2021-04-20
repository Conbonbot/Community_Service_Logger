Rails.application.routes.draw do
  

  get 'supervisor_password_resets/new'

  get 'supervisor_password_resets/edit'

  get 'password_resets/new'

  get 'password_resets/edit'

   get 'sessions/new'
   
   get '/admin/levels', to: 'admin#levels'
   
   root 'users#new'
   get    '/formA',                   to: 'users#new'
   post   '/formA',                   to: 'users#create'
   get    '/formB',                   to: 'supervisors#new'
   get    '/new_hour',                to: 'hours#new'
   post   '/new_hour',                to: 'hours#create'
   get    '/delete/:id',              to: 'hours#delete', :as => :new_hour_delete_with_parameter
   post   '/full_delete/:id',         to: 'hours#full_delete', :as => :new_delete_with_parameter
   get    '/admin/transfer',          to: 'admin#transfer', :as => :transfer
   get    '/admin/full_transfer/:id', to: 'admin#full_transfer', :as => :get_full_transfer
   post   '/admin/full_transfer/:id', to: 'admin#full_transfer', :as => :post_full_transfer
   get    '/admin',                   to: 'admin#home', :as => :admin_home
   get    '/admin/spreadsheet',       to: 'admin#spreadsheet'
   get    '/admin/freshmen',          to: 'admin#freshmen'
   get    '/admin/sophomores',        to: 'admin#sophomores'
   get    '/admin/juniors',           to: 'admin#juniors'
   get    '/admin/seniors',           to: 'admin#seniors'
   get    '/admin/charts',            to: 'admin#charts'
   get    '/admin/students',          to: 'admin#students'
   get    '/admin/sup_tables',        to: 'admin#suptables'
   get    '/admin/sup_charts',        to: 'admin#supcharts'
   get    '/admin/tables',            to: 'admin#tables'
   get    '/admin/approve_stu',       to: 'admin#activate_stu'
   get    '/admin/yes/:id',           to: 'admin#yes', :as => :new_admin_yes_with_parameter
   get    '/admin/give_hours',        to: 'admin#give_hours'
   get    '/pre_login',               to: 'sessions#pre'
   get    '/user_login',              to: 'sessions#new'
   post   '/user_login',              to: 'sessions#create'
   get    '/user_logout',             to: 'sessions#destroy'
   delete '/user_logout',             to: 'sessions#destroy'
   get    '/supervisors',             to: 'users#all_supervisors'
   get    '/supervisor_login',        to: 'sessions#new_sup'
   post   '/supervisor_login',        to: 'sessions#create_sup'
   get    '/supervisor_logout',       to: 'sessions#destroy_sup'
   delete '/supervisor_logout',       to: 'sessions#destroy_sup'
   get    '/yes/:id',                 to: 'supervisors#yes', :as => :new_yes_with_parameter
   get    '/no/:id',                  to: 'supervisors#no', :as => :new_no_with_parameter
   get    'users/:user_id/admin',     to: 'admin#students',  as: :user_admin
   get    '/approved',                to: 'supervisors#approved'
   resources :users
   resources :admin
   resources :supervisors
   resources :account_activation, only: [:edit, :sup_edit]
   resources :account_activation do
       member do
           get "sup_edit"
       end
   end
   
   resources :hours, only: [:create]
   resources :password_resets, only: [:new, :create, :edit, :update]
   resources :supervisor_password_resets, only: [:new, :create, :edit, :update]
   
end
