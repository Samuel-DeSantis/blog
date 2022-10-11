class Post < ApplicationRecord

  def format
    effects = {
      "[code]": {
        open: "<code>",
        close: "</code>"
      },
      "[bold]": {
        open: "<b>",
        close: "</b>"
      },
      "[underline]": {
        open: "<u>",
        close: "</u>"
      },
      "[author]": {
        open: "<figcaption class='blockquote-footer'>",
        close: "</figcaption>"
      },
      "[br]": "<br>"
    }

    effects.each do |key, value|
      status = true
      while self.content.include?(key.to_s)
        if key.to_s == "[br]"
          self.content.gsub!(key.to_s, value) 
        else
          if status
            self.content.sub!(key.to_s, value[:open])
            status = false
          else
            self.content.sub!(key.to_s, value[:close])
            status = true          
          end
        end   
      end
    end

    self.content
  end

          # effects = [
    #   method(:line_break), 
    #   method(:code), 
    #   method(:bold), 
    #   method(:underline)
    # ]
    # effects[0].call(content)
    # effects.each { |fx| fx.call(content) }

    # content = code(content)
    # content = line_break(content)
    # content = bold(content)
    # content = underline(content)

  def code (content)
    between(content, "[code]", method(:wrap_code_tag))
  end

  def between (content, tag, fx)
    parse = content.split(tag)
    if parse.count.odd?
      parse.collect!.each_with_index { |text, index|
        if index.odd?
          fx.call(text)
        else
          text
        end
      }.join()
    else
      "ERROR:[CODE]_TAG_MISSING_CLOSURE=>" + content
    end
  end
  
end
