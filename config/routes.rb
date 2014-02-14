Memochi::Application.routes.draw do
  root :to => "StaticPages#home"
  resources :users
  resources :memos, :except => [:edit, :update]
  resource :session, :only => [:new, :create, :destroy]
end
