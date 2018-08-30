Rails.application.routes.draw do

  scope :constraints => lambda { |req| req.format == :json } do
    resources :patients, :only => [:index, :show, :create, :update]
    resources :appointments, :only => [:index, :show, :create, :update]
    resources :customers, :only => [:index, :show, :create, :update]
    resources :admissions, :only => [:index, :show, :create, :update]
    resources :notes, :only => [:create]

    get '/appointments/filter/:filter' => "appointments#filter"
    
    scope '/search' do
      post '/staff' => 'search#staff'
    end
  end

  root :to => 'pages#home'
  match "*path", to: "pages#home", via: :all
  
end
