module Lookbook
  class PaneGroupDivider < Lookbook::BaseComponent
    def initialize(name:, **kwargs)
      set_tag_data_attr("gutter-id", name)
    end
  end
end
