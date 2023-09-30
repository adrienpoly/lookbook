module Lookbook
  class InspectorController < Lookbook::ApplicationController
    include Lookbook::DummyContentConcern # temp, for development

    def show
      @inspector_data = inspector_data
    end

    private

    InspectorData = Struct.new(:output, :source, keyword_init: true)

    def inspector_data
      InspectorData.new(
        output: example_html.html_safe,
        source: example_erb.html_safe
      )
    end
  end
end
