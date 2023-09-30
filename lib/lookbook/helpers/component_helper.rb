module Lookbook
  module ComponentHelper
    COMPONENT_CLASSES = {}

    def book_icon(icon_name = nil, **kwargs)
      book_component("icon", name: icon_name, **kwargs)
    end

    def book_button(href = nil, **kwargs, &block)
      book_component("button", href: href, **kwargs, &block)
    end

    def book_button_group(**kwargs, &block)
      book_component("button-group", **kwargs, &block)
    end

    def book_tab(name = nil, **kwargs, &block)
      book_component("tab", name: name, **kwargs, &block)
    end

    def book_tab_group(name = nil, **kwargs, &block)
      book_component("tab-group", name: name, **kwargs, &block)
    end

    def book_tab_panel(name = nil, **kwargs, &block)
      book_component("tab-panel", name: name, **kwargs, &block)
    end

    def book_tab_panel_group(name = nil, **kwargs, &block)
      book_component("tab-panel-group", name: name, **kwargs, &block)
    end

    def book_pane(**kwargs, &block)
      book_component("pane", **kwargs, &block)
    end

    def book_pane_group(**kwargs, &block)
      book_component("pane-group", **kwargs, &block)
    end

    def book_panel(**kwargs, &block)
      book_component("panel", **kwargs, &block)
    end

    def book_toolbar(**kwargs, &block)
      book_component("toolbar", **kwargs, &block)
    end

    def book_toolbar_section(**kwargs, &block)
      book_component("toolbar-section", **kwargs, &block)
    end

    def book_toolbar_section_divider(**kwargs, &block)
      book_component("toolbar-section-divider", **kwargs, &block)
    end

    def book_code(source = nil, **kwargs, &block)
      comp = resolve_book_class("code").new(**kwargs)
      render comp do
        block ? block.call : source
      end
    end

    def book_code_panel(**kwargs, &block)
      book_component("code-panel", **kwargs, &block)
    end

    def book_preview_panel(**kwargs, &block)
      book_component("preview-panel", **kwargs, &block)
    end

    def book_prose_panel(**kwargs, &block)
      book_component("prose-panel", **kwargs, &block)
    end

    protected

    def book_component(name, *args, **kwargs, &block)
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
