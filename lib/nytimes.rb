# This is a Configuration Module For New York Times
module NewYorkTimes
  def setup
    self[:caption] = 'New York Times'
    self[:url] = 'https://www.nytimes.com'
    section_hashes = []
    section_hashes << hash1 << hash2 << hash3
    self[:section_hashes] = section_hashes
  end

  def hash1
    hash = {}
    hash[:section_class] = 'css-1om4z5c'
    hash[:title] = 'top articles'
    hash[:article_tag] = 'article'
    hash[:article_header_tag] = 'h2'
    hash[:article_desc_tag] = 'p'
    hash
  end

  def hash2
    hash = {}
    hash[:section_class] = 'css-1nivyeh'
    hash[:title] = 'latest news'
    hash[:article_tag] = 'article'
    hash[:article_header_tag] = 'h2'
    hash[:article_desc_tag] = 'p'
    hash
  end

  def hash3
    hash = {}
    hash[:section_class] = 'css-15zaaaz'
    hash[:title] = 'featured'
    hash[:article_tag] = 'article'
    hash[:article_header_tag] = 'h2'
    hash[:article_desc_tag] = 'p'
    hash
  end
end
