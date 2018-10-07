Rails.application.routes.draw do
   root 'users#new'
   get  '/formA', to: 'users#new'
   post '/formA', to: 'users#create'
   get  '/formB', to: 'users#volunteer'
   get  '/formC', to: 'users#hours'
   resources :users
   
  
end
