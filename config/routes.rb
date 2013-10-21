Ticketee::Application.routes.draw do
  root "projects#index"

  resources :projects, only: [:new, :index, :create, :show]
end
