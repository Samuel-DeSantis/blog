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
      "[bq]": {
        open: "<blockquote class='blockquote'>",
        close: "</blockquote>"
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
  def line_break (content)
    parse = content.split("[br]")
    parse.collect! { |text| wrap_p_tag(text) + "</br>" }
    parse.join()
  end

  def code (content)
    between(content, "[code]", method(:wrap_code_tag))
  end

  def bold (content)
    between(content, "[b]", method(:wrap_bold_tag))
  end

  def underline (content)
    between(content, "[u]", method(:wrap_underline_tag))
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
  
  def html_wrap (text, tag)
    add_carrots(tag) + text + add_carrots(tag)
  end

  def wrap_p_tag (text)
    "<p>" + text + "</p>"
  end

  def wrap_code_tag (text)
    "<code>" + text + "</code>"
  end

  def wrap_bold_tag (text)
    "<b>" + text + "</b>"
  end

  def wrap_underline_tag (text)
    "<u>" + text + "</u>"
  end

  def add_brackets (tag)
    "[" + tag + "]"
  end

  def add_carrots (tag)
    "<" + tag + ">"
  end

end
