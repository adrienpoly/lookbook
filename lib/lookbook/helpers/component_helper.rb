module Lookbook
  module ComponentHelper
    COMPONENT_CLASSES = {}

    def look_icon(icon_name = nil, **kwargs)
      look_component("icon", name: icon_name, **kwargs)
    end

    def look_component(name, *args, **kwargs, &block)
      comp = resolve_component_class(name).new(*args, **kwargs)
      render comp, &block
    end

    def resolve_component_class(*args)
      ref = args.join("/")
      COMPONENT_CLASSES[ref] ||= begin
        klass = ref.to_s.tr("-", "_").camelize
        "Lookbook::#{klass}".constantize
      end
    end
  end
end
