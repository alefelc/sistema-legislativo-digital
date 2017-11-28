Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  # Define access for users
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock' }

  # Set dashboard as root
  root to: 'dashboard#index'
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    delete '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Reception routes
  resources :procedures do
    get 'print', on: :collection
  end
  resources :initiators

  # Legislative area
  resources :administrative_files, only: [:index, :show]
  resources :legislative_files
  resources :derivated_procedures do
    get 'print', on: :collection
  end
  resources :circuitos ##### REPLACE IT WITH 'LOOPS' #####

  # Legislative policies routes
  resources :declaracions do
    get 'search_exp', on: :collection
    get 'search_norma', on: :collection
    get 'search_tag', on: :collection
  end
  resources :ordenanzas do
    get 'search_exp', on: :collection
    get 'search_norma', on: :collection
    get 'search_tag', on: :collection
  end
  resources :resolucions do
    get 'search_exp', on: :collection
    get 'search_norma', on: :collection
    get 'search_tag', on: :collection
  end
  resources :decretos do
    get 'search_exp', on: :collection
    get 'search_norma', on: :collection
    get 'search_tag', on: :collection
  end
  resources :especials do
    get 'search_exp', on: :collection
    get 'search_norma', on: :collection
    get 'search_tag', on: :collection
  end
  resources :otra_normas do
    get 'search_exp', on: :collection
    get 'search_norma', on: :collection
    get 'search_tag', on: :collection
  end

  resources :persons, only: [:create, :update, :new], as: :people
  resources :reparticion_oficials
  resources :dependencia_municipals
  resources :pendientes, only: :index

  resources :expediente_reports   ##### yet useful? #####
  resources :normas

  resources :persons
  resources :government_offices
  resources :councilors
  resources :commissions
  resources :blocks
  resources :municipal_offices
  resources :government_organs
  resources :periods

  get 'calendar', to: 'calendar#index'
  resources :legislative_sessions

  # Admin access only
  # Users and role access
  resources :users
  resources :roles
  #resources :system_params   #### In the future maybe?
  resources :tags
  resources :legislative_file_states

  resources :laws
  resources :day_plans
  resources :signators
end
