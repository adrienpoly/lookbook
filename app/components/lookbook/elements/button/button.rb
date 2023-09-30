module Lookbook
  class Button < Lookbook::BaseComponent
    include AcceptsOptionsConcern

    SIZES = %i[xs sm md lg xl]
    THEMES = %i[default inverted]

    tag_attr :href, :disabled, :type, :value, :name

    accepts_option :size, from: SIZES, default: :md
    accepts_option :theme, from: THEMES, default: :default

    with_slot :icon do |icon_name = nil, size: nil, **kwargs|
      size ||= get_option_value(:size)
      Lookbook::Icon.new(name: icon_name, size: size, **kwargs)
    end

    with_slot :dropdown

    before_render do
      raise "Missing button label" unless label
    end

    after_initialize do
      with_icon(args[:icon], size: get_option_value(:size)) if args[:icon]
    end

    attr_reader :on_click

    def initialize(label: nil, click: nil, **kwargs)
      @label = label
      @on_click = click
    end

    def tag_name
      tag_attrs[:href].present? ? :a : :button
    end

    def label
      (content? && content.present?) ? content : @label
    end
  end
end
