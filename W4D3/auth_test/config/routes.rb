Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :users, only: [:new, :create]
  resource :session_controllers, only: [:new, :create, :destroy]
end
