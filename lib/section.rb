class Section
  attr_reader :title, :articles, :valid

  def initialize(doc, hash, mark_up_section)
    @container = mark_up_section.nil? ? doc : mark_up_section
    @articles = []
    set_title(hash, @container)
    @valid = !@title.nil?
    load_articles(hash, @container) if @valid
  end

  private

  def set_title(hash, container)
    if hash[:title_class]
      title_element = container.css('.' + hash[:title_class])
      if title_element.inner_html.strip.size.positive?
        @title = extract_title(title_element.inner_html.strip, title_element)
      end
    elsif hash[:title]
      @title = hash[:title]
    end
  end

  def load_articles(hash, container)
    mark_up_articles = []
    mark_up_articles = container.css(hash[:article_tag]) if hash[:article_tag]
    mark_up_articles = container.css('.' + hash[:article_class]) if hash[:article_class]
    mark_up_articles.each do |mark_up_article|
      article = Article.new(hash, mark_up_article)
      @articles << article if article.header.size.positive?
    end
  end
end
