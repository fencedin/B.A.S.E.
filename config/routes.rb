Base::Application.routes.draw do
  root 'shires#index'
  match('shires', {:via => :post, :to => 'shires#create'})
  match('shires/:slug', {:via => :get, :to => 'shires#show'})
  match('shires/:slug', {:via => :delete, :to => 'shires#delete'})

  match('/shires/:slug/attack', {via: [:put, :patch], to: 'shires#update'})
  match('/shires/:slug/mine', {via: [:put, :patch], to: 'battalions#update'})

  match('shires/:slug/battalion/:id', {via: [:put, :patch], to: 'battalions#update'})
end
