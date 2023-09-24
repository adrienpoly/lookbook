module Lookbook
  class EmbedsController < Lookbook::ApplicationController
    layout -> { multi_format_layout("lookbook/embed") }

    def show
    end
  end
end
