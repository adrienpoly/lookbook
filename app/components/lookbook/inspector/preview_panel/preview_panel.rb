module Lookbook
  class PreviewPanel < Lookbook::BaseComponent
    with_slot :viewport, Lookbook::Viewport

    before_render do
      unless viewport?
        with_viewport(**component_args) { content }
      end
    end
  end
end
