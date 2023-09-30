module Lookbook
  class PaneGroup < Lookbook::BaseComponent
    include AcceptsOptionsConcern

    accepts_option :layout, from: %i[rows columns], default: :columns

    with_slot :pane do |name = nil, **kwargs|
      name ||= "pane-#{@pane_counter += 1}"
      Lookbook::Pane.new(name: name, **kwargs.deep_merge({
        x: {init: "registerItem"}
      }))
    end

    def initialize(*)
      @pane_counter = -1
    end
  end
end
