Rails.application.routes.draw do

  resources :interventions
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  
  resources :elevators
  resources :batteries
  resources :customers
  resources :addresses

  resources :columns
  resources :building_details
  resources :buildings

  resource :quotes
  resource :leads

  resource :employees

  ActiveAdmin.routes(self)
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  #admin_root ''

  


  # GET routes
  get 'quote' => 'quotes#quote'
  get 'corporate' => 'pages#corporate'
  get 'residential' => 'pages#residential'
  get 'index' => 'pages#index'
  get 'admin_root' => 'elevators#index'
  # map#index'
  get 'customer' => 'elevators#index'
  get 'interventionform' => 'interventions#interventionform'
  get '/building' => 'buildings#buildingselection'
  get 'streamer' => 'pages#streamer'
  # get 'building' => 'buildings#buildingselection'
  # POST routes

  post 'quote/create' => 'quotes#create'
  post 'contact/create' => 'leads#create'
  post 'intervention/create' => 'interventions#create'
  post 'intervention/customer-id' => 'interventions#customerid'
  # post 'pages/twilio' => 'pages#twilio'
end

