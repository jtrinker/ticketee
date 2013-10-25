Ticketee::Application.routes.draw do
  devise_for :users
  
  namespace :admin do
  	resources :users
  end

  root "projects#index"

  resources :projects do
  	resources :tickets
  end
end
