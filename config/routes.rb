Rails.application.routes.draw do

  # get "cocktails/new", to: "cocktails#new"
  # post "cocktails", to: "cocktails#create"

  # get "cocktails", to: "cocktails#index"
  # get "cocktails/:id", to: "cocktails#show"

  # get "cocktails/:id/doses/new", to: "cocktails#edit"
  # post "cocktails/:id/doses", to: "cocktails#update"

  resources :cocktails, only: [:show, :index, :new, :create] do
    resources :doses, only: [:create]
  end
  root "cocktails#index"

  mount Attachinary::Engine => "/attachinary"

end
