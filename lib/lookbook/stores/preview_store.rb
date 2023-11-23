module Lookbook
  class PreviewStore < Store
    def to_collection
      PreviewCollection.new(entities)
    end
  end
end
