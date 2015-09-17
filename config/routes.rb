Rails.application.routes.draw do

  resources :posts 
  #we want posts to be the root of the application, so posts index action
  root "posts#index"

end
