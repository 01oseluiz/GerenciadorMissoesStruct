Rails.application.routes.draw do

  get 'main_page/index'
  get 'main_page/table'
  root 'main_page#index'

  resources :pessoas
  resources :tp_users
  resources :rk_ninjas
  resources :nv_difics
  resources :missos
  resources :equipes
  resources :comentarios
  resources :avaliacos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
