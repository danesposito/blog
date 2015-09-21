Rails.application.routes.draw do

  resources :posts  do
  	resources :comments
  end


  #we want posts to be the root of the application, so posts index action
  root "posts#index"

  #The full resources are not needed, like update, delete, etc, so we do not have to use resources as above.
  get '/about', to: 'pages#about'
  #This allows you to go to /about instead of /pages/about

end
