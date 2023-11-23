module Lookbook
  class PageLoader < Service
    attr_reader :pages, :paths

    def initialize(page_store, paths)
      @pages = page_store
      @paths = paths
    end

    def call
      code_objects = PageParser.call(paths)
      entities = PageCompiler.call(code_objects)
      pages.update(entities)
      pages
    end
  end
end
