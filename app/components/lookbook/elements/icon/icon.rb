module Lookbook
  class Icon < Lookbook::BaseComponent
    include AcceptsOptionsConcern

    ICON_CACHE = {}

    InvalidIconError = Class.new(StandardError)

    accepts_option :size, from: %i[xs sm md lg xl]
    accepts_option :spin, from: [true, false]
    accepts_option :style, from: [:line, :fill]

    def initialize(name:, **kwargs)
      @icon_name = name.to_s.tr("_", "-")
      set_tag_data_attr(:icon, @icon_name)
    end

    def svg
      ICON_CACHE[@icon_name] ||= read_svg
    end

    def read_svg
      File.read(svg_path).html_safe
    end

    def svg_path
      Lookbook::Engine.root.join("assets/icons/#{@icon_name}.svg")
    end
  end
end
