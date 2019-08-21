Rails.application.routes.draw do
  resources :alunos
  root to: 'welcome#index'
  resources :mining_types
  resources :moedas
  resources :home
  resources :hello
  resources :welcome
  #resources :alunos
  get 'alunos/index'
  get 'home/html'
  get 'welcome/index'
  get 'hello/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
