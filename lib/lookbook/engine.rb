require "turbo-rails"

module Lookbook
  class Engine < Rails::Engine
    isolate_namespace Lookbook

    config.autoload_paths << File.expand_path(root.join("app/components"))

    initializer "lookbook.assets.serve" do
      config.app_middleware.use(
        Rack::Static,
        urls: [(ENV["LOOKBOOK_ENV"] == "development") ? "/lookbook-dev" : "/lookbook-assets"],
        root: root.join("public").to_s
      )
    end

    class << self
      def host_config
        Rails.application.config
      end
    end
  end
end
