module Lookbook
  class App < Lookbook::BaseComponent
    with_slot :header, Lookbook::Header

    with_slot :sidebar

    with_slot :main
  end
end
