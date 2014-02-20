Memochi::Application.routes.draw do
  root :to => "StaticPages#index"
  
  resources :users
  resources :memos, :except => [:edit, :update]
  resource :session, :only => [:new, :create, :destroy]
end
