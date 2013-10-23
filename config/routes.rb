Ticketee::Application.routes.draw do
  root "projects#index"
  get "/signin", to: "session#new"
  
  resources :users
  resources :projects do
  	resources :tickets
  end
end
