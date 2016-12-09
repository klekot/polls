Rails.application.routes.draw do
  get '/admin' => 'admin#index'

  root to: 'polls#index'
  get '/poll' => 'polls#poll'
  post '/question' => 'polls#question'
  get '/rules' => 'polls#rules'
  get '/resume' => 'polls#resume'
  post '/resume' => 'polls#resume'
  post '/countdown' => 'polls#countdown'
  devise_for :users
end
