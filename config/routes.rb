Rails.application.routes.draw do

  devise_for :pessoas, controllers: {registrations: 'pessoas/registrations'}

  get 'main_page/index'
  root 'main_page#index'

  resources :pessoas do
    resources :avaliacos
  end
  resources :tp_users
  resources :rk_ninjas
  resources :nv_difics
  resources :missos do
    resources :comentarios
  end
  resources :equipes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
