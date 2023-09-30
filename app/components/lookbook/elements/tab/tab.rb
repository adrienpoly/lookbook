module Lookbook
  class Tab < Lookbook::BaseComponent
    include AcceptsOptionsConcern

    accepts_option :orientation, from: [:horizontal, :vertical], default: :horizontal

    with_slot :icon do |name = nil, size: nil, **kwargs|
      Lookbook::Icon.new(name: name, size: :sm, **kwargs, class: "tab-icon")
    end

    def initialize(name:, **kwargs)
      raise "Missing tab name" unless name.present?

      set_tag_data_attr("tab-id", name)
      with_icon(kwargs[:icon]) if kwargs[:icon]
    end
  end
end
