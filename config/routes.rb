Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :usuario, ActiveAdmin::Devise.config

  root to: 'dashboard#index'

  ## routes norms
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

  resources :dashboard do
    get 'search', on: :collection
  end

  ## routes mesa de entradas
  resources :despachos do 
    get 'search_exp', on: :collection
  end
end
