module Lookbook
  class Tag < Lookbook::Component::Base
    include ActionView::Helpers::TagHelper
    include Lookbook::AlpineHelper

    SELF_CLOSING_TAGS = %i[area base br col embed hr img input link meta param source track wbr].freeze

    attr_reader :tag_name, :root, :strip

    def initialize(tag_name = :div, strip: false, root: false, **tag_attrs)
      @tag_name = tag_name
      @tag_attrs = tag_attrs
      @strip = strip
      @root = root
    end

    def content
      strip ? super.strip_heredoc.strip : super
    end

    def call
      if SELF_CLOSING_TAGS.include?(@tag_name)
        tag(tag_name, tag_attrs)
      else
        content_tag(tag_name, content, tag_attrs)
      end
    end

    def tag_attrs
      attrs = @tag_attrs.except(:x)

      alpine_attrs = @tag_attrs.fetch(:x, {})
      if alpine_attrs.any?
        attrs.merge!(x_attrs(alpine_attrs, root: root))
      end

      attrs
    end
  end
end
