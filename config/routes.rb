Rails.application.routes.draw do
 # get 'static_pages/FormA'
   root 'static_pages#FormA'

  get '/FormA', to: 'static_pages#FormA'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
