module Lookbook
  class Collection
    include Enumerable

    delegate_missing_to :entities

    attr_reader :entities

    def initialize(entities = [])
      @entities = entities
    end

    def to_a
      entities
    end
  end
end
