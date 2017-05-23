Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  # Define access for users
  devise_for :users

  # Set dashboard as root
  root to: 'dashboard#index'

  # Reception routes
  resources :procedures do
    get 'print', on: :collection
  end
  resources :initiators

  # Legislative area
  resources :administrative_files, only: [:index, :show]
  resources :legislative_files
  resources :derivated_procedures
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

  # Reports/statistics area ##### Rethink this and talk to LALO #####
  namespace :statitics do
    get 'mesa_de_entradas'
    get 'expedientes'
    get 'normas'
  end
  namespace :reports do
    get 'mesa_de_entradas'
    get 'expedientes'
    get 'normas'
  end

  resources :expediente_reports   ##### yet useful? #####
  resources :normas

  resources :persons
  resources :government_offices
  resources :councilors
  resources :municipal_offices
  resources :government_organs

  get 'calendar', to: 'calendar#index'
  resources :sessions

  # Admin access only
  # Users and role access
  resources :users
  resources :roles
  #resources :system_params   #### In the future maybe?
end
