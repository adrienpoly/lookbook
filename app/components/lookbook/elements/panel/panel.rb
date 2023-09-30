module Lookbook
  class Panel < Lookbook::BaseComponent
    with_slot :actions do |**kwargs|
      Lookbook::Button.new(**kwargs, x: {init: "registerAction", show: "showAction"})
    end
  end
end
