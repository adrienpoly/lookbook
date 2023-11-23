module Lookbook
  class PageCompiler < Service
    attr_reader :code_objects

    def initialize(code_objects = [])
      @code_objects = code_objects
    end

    def call
      []
    end
  end
end
