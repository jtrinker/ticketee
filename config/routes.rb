Ticketee::Application.routes.draw do
  get "tickets/index"
  get "tickets/new"
  get "tickets/create"
  get "tickets/show"
  root "projects#index"

  resources :projects do
  	resources :tickets
  end
end
