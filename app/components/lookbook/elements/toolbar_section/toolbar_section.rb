module Lookbook
  class ToolbarSection < Lookbook::BaseComponent
    include AcceptsOptionsConcern

    accepts_option :align, from: %i[start end], default: :start
    accepts_option :divider, from: [true, false], default: false
    accepts_option :size, from: Lookbook::Toolbar::SIZES, default: :md
    accepts_option :theme, from: [:default, :dark, nil], default: nil

    with_slot :button_group do |*args, **kwargs, &block|
      @items << render(Lookbook::ButtonGroup.new(**kwargs, size: get_option_value(:size)), &block)
    end

    with_slot :tab_group do |name = nil, **kwargs, &block|
      @items << render(Lookbook::TabGroup.new(name: name, **kwargs), &block)
    end

    with_slot :divider do |**kwargs, &block|
      @items << render(Lookbook::ToolbarSectionDivider.new(**kwargs), &block)
    end

    with_slot :html do |&block|
      @items << capture(&block)
    end

    attr_reader :items

    def initialize(*)
      @items = []
      super
    end
  end
end
