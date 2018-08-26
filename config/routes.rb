Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'pages#home'

  resources :admissions, :only => [:index, :show, :create, :new]
  resources :customers, :only => [:index, :show, :create, :new]
  resources :appointments, :only => [:index, :show, :create, :new]
  resources :patients, :only => [:index, :show, :create, :new]
end
