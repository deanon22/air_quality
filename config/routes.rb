Rails.application.routes.draw do

  get '/zipcode', to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'  
  post 'zipcode' => 'home#zipcode'
end
