module Lookbook
  class ButtonGroup < Lookbook::BaseComponent
    include AcceptsOptionsConcern

    SIZES = Lookbook::Button::SIZES

    accepts_option :size, from: SIZES, default: :md

    with_slot :button do |href = nil, **kwargs|
      Lookbook::Button.new(href: href, **kwargs, size: get_option_value(:size))
    end
  end
end
