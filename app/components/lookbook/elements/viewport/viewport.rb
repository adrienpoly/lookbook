module Lookbook
  class Viewport < Lookbook::BaseComponent
    attr_reader :src

    def initialize(src:, **kwargs)
      @src = src
    end
  end
end
