Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :students
  resources :teachers, only: [:index, :show]
  resources :messages, only: [:index, :create]

  post '/received_sms', to: 'received#sms'
  post '/received_calls', to: 'received#calls'
  post '/calls', to: 'calls#create'
end
