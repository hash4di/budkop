BudKop::Application.routes.draw do |map|
  resources :contacts, :actions => [:create, :index]
  resource :user
  resource :user_session
  resource :account, :controller => "users"
#  resource :home, :controller => 'home'
  resource :services
  match "/minikoparka" => 'services#show'
  resource :transport
  resource :gallery, :controller => 'gallery'
  match "/galeria" => 'gallery#show'
  resource :people
  match "/o_nas" => 'people#show' 
  resource :contact_us
  match "/kontakt" => 'contact_us#show'
  root :to => 'people#show'
  
end
