module Lookbook
  class PageParser < Service
    attr_reader :paths

    def initialize(paths)
      @paths = paths
    end

    def call
      []
    end
  end
end
