module Lookbook
  class CodePanel < Lookbook::BaseComponent
    with_slot :code, Lookbook::Code

    before_render do
      unless code?
        with_code(**component_args) { content }
      end
    end
  end
end
