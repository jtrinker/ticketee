Ticketee::Application.routes.draw do
  devise_for :users

  namespace :admin do
  	root "base#index"
  	resources :users
  end

  root "projects#index"

  resources :projects do
  	resources :tickets
  end
end
