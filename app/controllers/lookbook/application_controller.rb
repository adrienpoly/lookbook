module Lookbook
  class ApplicationController < ActionController::Base
    helper Lookbook::ApplicationHelper
    helper Lookbook::ComponentHelper

    protected

    def multi_format_layout(html_layout = "application")
      if turbo_frame_request?
        "turbo_rails/frame"
      else
        html_layout
      end
    end
  end
end
