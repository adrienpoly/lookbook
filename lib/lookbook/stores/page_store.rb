module Lookbook
  class PageStore < Store
    def to_collection
      PageCollection.new(entities)
    end
  end
end
