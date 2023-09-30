module Lookbook
  class Code < Lookbook::BaseComponent
    include AcceptsOptionsConcern

    accepts_option :lang, from: %i[html javascript markdown ruby erb], default: :html
    accepts_option :wrap, from: [true, false], default: false

    def source
      content.to_str.strip_heredoc.strip
    end
  end
end
