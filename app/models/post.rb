class Post < ApplicationRecord

  def format

  end

  def line_break
    paragraphs = self.content.split("[br]")
    paragraphs.collect! { |paragraph| "<p>" + paragraph + "</p></br>" }
    paragraphs.join()
  end

  def code
    paragraphs = self.content.split("[code]")
    paragraphs.collect! { |paragraph| "<code>" + paragraph + "</code>" }
    paragraphs.join()
  end

  def bold
  end

  def underline
  end

end
