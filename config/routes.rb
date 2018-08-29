Rails.application.routes.draw do

  scope :constraints => lambda { |req| req.format == :json } do
    resources :patients, :only => [:index, :show, :create, :new]
    resources :appointments, :only => [:index, :show, :create, :new]
    resources :customers, :only => [:index, :show, :create, :new]
    resources :admissions, :only => [:index, :show, :create, :new]
    resources :notes, :only => [:create]
    scope '/search' do
      post '/staff' => 'search#staff'
    end
  end

  root :to => 'pages#home'
  match "*path", to: "pages#home", via: :all
  
end
