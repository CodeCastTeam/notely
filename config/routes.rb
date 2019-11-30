Rails.application.routes.draw do

  # The actions that are standard in Rails are:
  # new -> display form to create a record
  # create -> handle creating the record
  # edit -> display form to edit a record
  # update -> handle updating the record
  # index -> list a group of records
  # show -> display one record
  # destroy -> delete a record

  # users -> references users controller
  resources :users, only: [:new, :create]
  # the line above generates routes to all the standard 7 actions in Rails
  # unless you restrict it with `except` or `only`

  resources :notes

  get "/sign_in", to: "sessions#new"
  post "/sign_in", to: "sessions#create"
  delete "/sign_out", to: "sessions#destroy"

  # when we receive an HTTP `GET` request to a URL `/`
  # then handle it with `pages` controller
  # and use the `index` action (method)
  # get '/', to: 'pages#index'
  root to: 'pages#index'
end
