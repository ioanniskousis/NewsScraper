require_relative 'strings'

class Article
  attr_reader :header, :description

  def initialize(hash, mark_up_article)
    set_header(hash, mark_up_article)
    set_description(hash, mark_up_article)
  end

  private

  def set_header(hash, mark_up_article)
    if hash[:article_header_tag]
      mark_up_header = mark_up_article.css(hash[:article_header_tag])
    elsif hash[:article_header_class]
      mark_up_header = mark_up_article.css('.' + hash[:article_header_class])
    end
    @header = extract_title(mark_up_header.inner_html.strip).uni_flat
  end

  def set_description(hash, mark_up_article)
    if hash[:article_desc_class]
      mark_up_description = mark_up_article.css('.' + hash[:article_desc_class])
    elsif hash[:article_desc_tag]
      mark_up_description = mark_up_article.css(hash[:article_desc_tag])
    end
    @description = extract_title(mark_up_description.inner_html.strip).uni_flat
  end
end
