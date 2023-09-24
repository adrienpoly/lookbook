module Lookbook
  module Entities
    class PagesController < Lookbook::ApplicationController
      layout -> { multi_format_layout("lookbook/page") }

      def show
      end
    end
  end
end
