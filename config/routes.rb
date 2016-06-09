require 'resque/server'
Rails.application.routes.draw do

  mount Resque::Server.new, at: "/resque"

  namespace :api do
    resources :users, extend: [:new, :edit]
    resources :sessions, extend: [:new, :edit, :show, :update]
    resources :images, extend: [:new, :edit]
    resources :tasks, extend: [:new, :edit]
  end
end
