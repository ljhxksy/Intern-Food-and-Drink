Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :admin do
    root "homepage#login"
    get "home", to: "homepage#home"
    post "login", to: "session#create"
  end
end
