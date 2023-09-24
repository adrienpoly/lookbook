module Lookbook
  module AlpineHelper
    def x_data(name = nil, data = {})
      if name.is_a?(Hash)
        data = name
        name = nil
      end

      props_str = data.present? ? jsify_data(data) : nil

      expression = if name.present?
        "#{jsify_var_name(name)}#{"(#{props_str})" if props_str.present?}"
      else
        props_str
      end

      expression.html_safe
    end

    def x_attrs(attrs, root: false)
      attrs.symbolize_keys!

      if root && !attrs.key?(:data)
        attrs[:data] = "" # Add empty x-data attribute if none has been specified
      end

      attrs.transform_values! { (_1 == true) ? "" : _1 } # convert boolean x-attributes

      # prefix attributes where needed
      attrs.transform_keys do |key|
        key = key.to_s
        key.first.in?(["@", ":"]) ? key : "x-#{key}"
      end
    end

    def jsify_data(hash)
      result = hash.reduce("") do |str, (k, v)|
        key = jsify_var_name(k)
        value = if v.is_a?(Hash)
          jsify_data(v)
        else
          v.to_json.gsub("'", "\\\\'").tr("\"", "'")
        end

        "#{"#{str}, " if str.present?}#{key}: #{value}"
      end

      "{#{result}}"
    end

    def jsify_var_name(name)
      name.to_s.tr("-", "_").camelize(:lower)
    end

    private

    include ActionView::Helpers::JavaScriptHelper
  end
end
