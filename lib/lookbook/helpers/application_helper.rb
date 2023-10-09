module Lookbook
  module ApplicationHelper
    def lookbook_asset_path(file, version: true)
      parts = [Engine.host_config.relative_url_root, lookbook_asset_dir, file].compact
      path = File.join(*parts)
      "/" + (version ? "#{path}?v=#{Lookbook::VERSION}" : path)
    end

    def lookbook_asset_dir
      (ENV["LOOKBOOK_ENV"] == "development") ? "lookbook-dev" : "lookbook-assets"
    end
  end
end
