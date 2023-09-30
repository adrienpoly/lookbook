module Lookbook
  class Toolbar < Lookbook::BaseComponent
    include AcceptsOptionsConcern

    THEMES = %i[primary secondary accent]
    SIZES = %i[sm md]

    with_slot :section do |**kwargs|
      Lookbook::ToolbarSection.new(**kwargs, size: get_option_value(:size))
    end

    accepts_option :theme, from: THEMES, default: :primary
    accepts_option :size, from: SIZES, default: :md
  end
end
