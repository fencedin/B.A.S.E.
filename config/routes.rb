Base::Application.routes.draw do
  root 'shires#index'
  match('shires', {:via => :post, :to => 'shires#create'})
  match('shires/:slug', {:via => :get, :to => 'shires#show'})
  match('shires/:slug', {:via => :delete, :to => 'shires#delete'})
end
