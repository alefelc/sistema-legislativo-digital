Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :usuarios

  root to: "dashboard#index"

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
end
