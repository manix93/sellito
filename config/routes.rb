Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homepage#index'

  get '/about', to: 'homepage#about'
  get '/cookies', to: 'homepage#cookies'
end
