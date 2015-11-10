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
    get 'get_derivacion', on: :collection
  end

  resources :condonacions do
    get 'get_iniciador', on: :collection
    get 'get_derivacion', on: :collection
  end

  resources :particulars do
    get 'get_iniciador', on: :collection
    get 'get_derivacion', on: :collection
  end

  resources :personas

  resources :reparticion_oficials

  resources :proyectos do
    get 'get_iniciador', on: :collection
    get 'get_derivacion', on: :collection
  end

  resources :comunicacion_oficials do
    get 'get_iniciador', on: :collection
    get 'get_derivacion', on: :collection
  end

end
