Saschu::Application.routes.draw do
  get "user_registrations/create"

  devise_for :users, controllers: { registrations: 'UserRegistrations' }
  root :to => "home#index"
end
