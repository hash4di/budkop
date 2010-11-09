BudKop::Application.routes.draw do |map|
  resources :contacts, :actions => [:create, :index]
  resource :user
  resource :user_session
  resource :account, :controller => "users"
#  resource :home, :controller => 'home'
  resource :services
  resource :gallery, :controller => 'gallery'
  resource :people
  resource :contact_us
  root :to => 'people#show'
end
