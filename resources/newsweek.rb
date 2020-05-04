# This is a Configuration Module For Newsweek
module NewsWeek
  def setup
    self[:caption] = 'NewsWeek'
    self[:url] = 'https://www.newsweek.com'
    section_hashes = []
    section_hashes << hash1 << hash2 << hash3 << hash4 << hash5 << hash6
    self[:section_hashes] = section_hashes
  end

  def hash1
    hash = {}
    hash[:section_id] = 'block-nw-home-featured-story'
    hash[:title_class] = 'block-title'
    hash[:article_tag] = 'article'
    hash[:article_header_tag] = 'h1 a'
    hash[:article_desc_class] = 'summary'
    hash
  end

  def hash2
    hash = {}
    hash[:section_id] = 'block-nw-home-featured-stories'
    hash[:title_class] = 'block-title'
    hash[:article_tag] = 'article'
    hash[:article_header_tag] = 'h3 a'
    hash[:article_desc_class] = 'summary'
    hash
  end

  def hash3
    hash = {}
    hash[:title] = 'special articles'
    hash[:article_class] = 'block-ibtmedia-special-item'
    hash[:article_header_tag] = 'h3 a'
    hash[:article_desc_class] = 'summary'
    hash
  end

  def hash4
    hash = {}
    hash[:section_id] = 'block-nw-home-featured-more'
    hash[:title_class] = 'block-title'
    hash[:article_tag] = 'article'
    hash[:article_header_tag] = 'h4 a'
    hash[:article_desc_class] = 'summary'
    hash
  end

  def hash5
    hash = {}
    hash[:section_id] = 'block-nw-editors-pick'
    hash[:title] = 'EDITOR\'S PICK'
    hash[:article_tag] = 'article'
    hash[:article_header_tag] = 'h3 a'
    hash[:article_desc_class] = 'summary'
    hash
  end

  def hash6
    hash = {}
    hash[:section_id] = 'block-nw-subfeatured'
    hash[:title_class] = 'block-title'
    hash[:article_tag] = 'li'
    hash[:article_header_class] = 'info'
    hash[:article_desc_class] = 'info'
    hash
  end
end
