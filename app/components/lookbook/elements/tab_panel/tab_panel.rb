module Lookbook
  class TabPanel < Lookbook::BaseComponent
    def initialize(name:, **kwargs)
      raise "Missing tab panel name" unless name.present?

      set_tag_data_attr("tab-panel-id", name)
    end
  end
end
