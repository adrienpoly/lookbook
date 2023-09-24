require "zeitwerk"
require "vite_rails"
require "lookbook/version"

loader = Zeitwerk::Loader.for_gem
loader.ignore("#{__dir__}/lookbook.rb")
loader.push_dir("#{__dir__}/lookbook", namespace: Lookbook)
loader.collapse("#{__dir__}/lookbook/helpers")
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
  end
end

require "rails"
require "lookbook/engine"
