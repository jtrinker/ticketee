Ticketee::Application.routes.draw do
  root "projects#index"

  resources :projects, only: [:new, :index, :create, :show, :edit, :update, :destroy]
end
