Ticketee::Application.routes.draw do
  devise_for :users

  root "projects#index"

  resources :projects do
  	resources :tickets
  end

  namespace :admin do
  	root "base#index"
  	resources :users
  end
end
