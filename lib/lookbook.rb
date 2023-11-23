require "zeitwerk"
require "lookbook/version"

loader = Zeitwerk::Loader.for_gem

loader.ignore("#{__dir__}/lookbook.rb")
loader.push_dir("#{__dir__}/lookbook", namespace: Lookbook)
loader.collapse("#{__dir__}/lookbook/helpers")
loader.collapse("#{__dir__}/lookbook/collections")
loader.collapse("#{__dir__}/lookbook/services")
loader.collapse("#{__dir__}/lookbook/stores")

loader.inflector.inflect "ui" => "UI"

loader.setup

# The Lookbook application entry point.
#
# @api public
module Lookbook
  class << self
    # Returns the installed Lookbook version
    #
    # @example :erb
    #   <p>Using Lookbook v<%= Lookbook.version %></p>
    #
    # @return [String] Version number string
    def version
      Lookbook::VERSION
    end

    def config
      Lookbook::Config.current
    end

    def pages
      Engine.page_store.to_collection
    end

    def previews
      Engine.preview_store.to_collection
    end
  end
end

require "rails"
require "lookbook/engine"
