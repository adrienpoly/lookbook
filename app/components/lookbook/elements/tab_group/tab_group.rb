module Lookbook
  class TabGroup < Lookbook::BaseComponent
    include AcceptsOptionsConcern

    accepts_option :orientation, from: [:horizontal, :vertical], default: :horizontal

    with_slot :tab do |name = nil, **kwargs|
      kwargs = kwargs.deep_merge({
        x: {init: "registerTab"},
        orientation: get_option_value(:orientation)
      })

      Lookbook::Tab.new(name: name, **kwargs)
    end

    def initialize(name:, **kwargs)
      raise "Missing tab group name" unless name.present?
      set_tag_data_attr("tab-group-id", name)
    end
  end
end
