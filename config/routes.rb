Saschu::Application.routes.draw do

  resources :courses do
    get 'my', on: :collection
    get 'choose', on: :collection
    post "mychoose", on: :collection
  end
                                                #
  ActiveAdmin.routes(self)

  get "user_registrations/create"

  devise_for :users, controllers: {registrations: 'UserRegistrations'}
  root :to => "home#index"

end
