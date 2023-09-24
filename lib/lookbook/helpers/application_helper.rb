module Lookbook
  module ApplicationHelper
    # Override: Returns the engine assets manifest.
    def vite_manifest
      Lookbook::Engine.vite_ruby.manifest
    end
  end
end
