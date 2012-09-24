Saschu::Application.routes.draw do
  ActiveAdmin.routes(self)

  get "user_registrations/create"

  devise_for :users, controllers: { registrations: 'UserRegistrations' }
  root :to => "home#index"
end
