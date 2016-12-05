Rails.application.routes.draw do
  root to: 'polls#index'
  get '/' => 'polls#inex'
  devise_for :users

end
