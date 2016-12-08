Rails.application.routes.draw do
  root to: 'polls#index'
  get '/poll' => 'polls#poll'
  post '/question' => 'polls#question'
  get '/rules' => 'polls#rules'
  get '/resume' => 'polls#resume'
  devise_for :users
end
