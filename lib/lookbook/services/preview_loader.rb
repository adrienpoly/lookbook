module Lookbook
  class PreviewLoader < Service
    attr_reader :previews, :paths

    def initialize(preview_store, paths)
      @previews = preview_store
      @paths = paths
    end

    def call
      code_objects = PreviewParser.call(paths)
      entities = PreviewCompiler.call(code_objects)
      previews.update(entities)
      previews
    end
  end
end
