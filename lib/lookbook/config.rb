module Lookbook
  class Config
    class << self
      alias_method :default, :new

      def defaults
        ActiveSupport::OrderedOptions.new.merge!({
          project_name: "Lookbook",
          preview_paths: default_preview_paths,
          page_paths: default_page_paths
        })
      end

      def default_preview_paths
        ["#{Rails.root}/test/components/previews"]
      end

      def default_page_paths
        ["#{Rails.root}/test/components/docs"]
      end
    end

    class_attribute :current, default: defaults, instance_predicate: false

    def initialize
      @config = self.class.defaults
    end

    delegate_missing_to :config

    private

    attr_reader :config
  end
end
