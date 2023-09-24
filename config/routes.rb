Lookbook::Engine.routes.draw do
  root "docs#index"

  get "/previews", to: redirect("")
  get "/previews/*path", to: "entities/previews#show"

  get "/pages", to: redirect("")
  get "/pages/*path", to: "entities/pages#show"

  get "/inspect", to: redirect("")
  get "/inspect/*path", to: "inspector#show"

  get "/embed", to: redirect("")
  get "/embed/*path", to: "inspector#show"

  get "/*path", to: "docs#show", via: :all
end
