module Lookbook
  class TabPanelGroup < Lookbook::BaseComponent
    with_slot :panel do |name = nil, **kwargs|
      kwargs = kwargs.deep_merge({
        x: {init: "registerPanel"}
      })

      Lookbook::TabPanel.new(name: name, **kwargs)
    end

    def initialize(name:, **kwargs)
      raise "Missing tab panel group name" unless name.present?
      set_tag_data_attr("tab-panel-group-id", name)
    end
  end
end
