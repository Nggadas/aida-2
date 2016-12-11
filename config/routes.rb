Rails.application.routes.draw do

  delete "/logout" => "users_session#destroy", as: :logout
  get "/login" => "users_session#new", as: :login
  get "/signup" => "users#new", as: :signup
  post "/authenticate" => "users_session#create", as: :authenticate

  resources :users, except:[:index, :destroy, :show]
  resources :memos
  resources :users_session, except:[:index, :edit]
  root 'memos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
