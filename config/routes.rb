ActionController::Routing::Routes.draw do |map|


  map.resources :users
  map.resource :session

  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  
  map.resources :doctipos
  map.resources :personas
  map.resources :departamentos
  map.resources :uejecutoras

  map.root :controller => "inicio",:action=>"inicio"
  map.resources :accounts, :has_many => :transactions

  #Pra  usar 127.0.0.1:3000/new_transactions
  #map.transactions 'transactions', :controller => 'accounts', :action => 'new_transaction'


  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
