Rails.application.routes.draw do

  resources :mitarbeiters
  resources :users
  resources :loginpages
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  resources :sessions, :only => [:create]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'page/index'

  resources :start
  get 'start', to: 'start#index', as: 'starta'
  root 'sessions#new'

  get 'plan', to: 'kalendar#index', as:'plan'
  get 'ansicht', to: 'kalendar#ansicht', as:'ansicht'
  get 'zuteilungswunsch', to: 'mitarbeiters#index', as:'zuteilungswunsch'

  match "kalendar/data", :to => "kalendar#data", :as => "data", :via => "get"

  post "kalendar/data/task", :to => "task#add"
  put "kalendar/data/task/:id", :to => "task#update"
  delete "kalendar/data/task/:id", :to => "task#delete"

end