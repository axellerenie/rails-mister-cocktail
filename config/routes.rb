Rails.application.routes.draw do

  root "cocktails#index"

  get "cocktails/new", to: "cocktails#new"
  post "cocktails", to: "cocktails#create"

  get "cocktails", to: "cocktails#index"
  get "cocktails/:id", to: "cocktails#show"

end
