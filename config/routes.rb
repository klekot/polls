Rails.application.routes.draw do
  root to: 'polls#index'
  get '/poll' => 'polls#poll'
  get '/rules' => 'polls#rules'
  post '/question' => 'polls#question'
  get '/next' => 'polls#next'
  post '/next' => 'polls#next'
  get '/resume' => 'polls#resume'
  devise_for :users
end
