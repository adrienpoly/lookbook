require "rails"
require "turbo-rails"

module Lookbook
  class Engine < Rails::Engine
    isolate_namespace Lookbook

    config.autoload_paths << File.expand_path(root.join("app/components"))

    config.before_configuration do
      config.lookbook = Lookbook::Config.current
    end

    config.after_initialize do
      Engine.load_previews
      Engine.load_pages
    end

    class << self
      def host_config
        Rails.application.config
      end

      def preview_paths
        Lookbook.config.preview_paths.select { |p| Dir.exist?(p) }.map(&:to_s)
      end

      def page_paths
        Lookbook.config.page_paths.select { |p| Dir.exist?(p) }.map(&:to_s)
      end

      def page_store
        @_page_store ||= PageStore.new
      end

      def preview_store
        @_preview_store ||= PreviewStore.new
      end

      def load_previews
        PreviewLoader.call(preview_store, preview_paths)
      end

      def load_pages
        PageLoader.call(page_store, page_paths)
      end
    end
  end
end
