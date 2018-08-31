Rails.application.routes.draw do

  scope :constraints => lambda { |req| req.format == :json } do
    resources :patients, :only => [:index, :show, :create, :update]
    resources :appointments, :only => [:index, :show, :create, :update]
    resources :customers, :only => [:index, :show, :create, :update]
    resources :admissions, :only => [:index, :show, :create, :update]
    resources :notes, :only => [:create]
    resources :tprs, :only => [:create]

    put '/staff/login' => "staffs#login"
    get '/appointments/filter/:filter' => "appointments#filter"
    get '/admissions/filter/:filter' => "admissions#filter"
    
    scope '/search' do
      post '/staff' => 'search#staff'
    end
  end

  root :to => 'pages#home'
  match "*path", to: "pages#home", via: :all
  
end
