Rails.application.config.app_middleware.use(
  Rack::Static,
  urls: [(ENV["LOOKBOOK_ENV"] == "development") ? "/lookbook-dev" : "/lookbook-assets"],
  root: Lookbook::Engine.root.join("public").to_s
)
