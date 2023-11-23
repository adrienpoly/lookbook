module Lookbook
  class ApplicationController < ActionController::Base
    helper Lookbook::ApplicationHelper
    helper Lookbook::ComponentHelper

    before_action :assign_template_vars

    protected

    def assign_template_vars
      @config = Lookbook.config
      @pages = Lookbook.pages
      @previews = Lookbook.previews
    end

    def multi_format_layout(html_layout = "application")
      if turbo_frame_request?
        "turbo_rails/frame"
      else
        html_layout
      end
    end
  end
end
