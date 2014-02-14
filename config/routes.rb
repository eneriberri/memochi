Memochi::Application.routes.draw do
  root :to => "StaticPages#home"
  resources :users
  resources :memos
  resource :session, :only => [:new, :create, :destroy]
end
