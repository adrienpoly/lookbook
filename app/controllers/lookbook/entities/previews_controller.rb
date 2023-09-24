module Lookbook
  module Entities
    class PreviewsController < Lookbook::ApplicationController
      layout -> { multi_format_layout("lookbook/preview") }

      def show
      end
    end
  end
end
