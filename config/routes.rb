Rails.application.routes.draw do
  # when we receive an HTTP `GET` request to a URL `/`
  # then handle it with `pages` controller
  # and use the `index` action (method)
  get '/', to: 'pages#index'
end
