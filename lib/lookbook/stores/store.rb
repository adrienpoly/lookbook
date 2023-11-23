module Lookbook
  class Store
    include Enumerable

    delegate_missing_to :entities

    attr_reader :entities

    def initialize
      @entities = []
    end

    def update(updates)
      entities.clear
      entities.push(*updates)
    end
  end
end
