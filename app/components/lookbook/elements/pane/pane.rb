module Lookbook
  class Pane < Lookbook::BaseComponent
    with_slot :toolbar, Lookbook::Toolbar

    with_slot :panel_group do |name = nil, **kwargs|
      Lookbook::TabPanelGroup.new(name: name, **kwargs)
    end

    def initialize(name:, size: "1fr", **kwargs)
      set_tag_data_attr("pane-id", name)
      set_tag_data_attr("default-size", size)
    end
  end
end
