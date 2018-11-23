Rails.application.routes.draw do
  
  root 'countries#index'
  
  resources :countries, only: [ :index ]
  
end
