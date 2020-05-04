class Source
  attr_reader :caption, :url, :sections, :errors, :search_results

  def initialize(hash)
    @caption = hash[:caption]
    @url = hash[:url]
    @section_hashes = hash[:section_hashes]
    @sections = []
    @errors = []
    @search_results = []
    @loaded = false
  end

  def open
    return true if @loaded

    @errors = []
    begin
      doc = Nokogiri::HTML(URI.open(@url, 'User-Agent' => 'mozilla'))
    rescue StandardError
      @errors << ('Could NOT open : ' + @caption)
      @errors << ('           URL : ' + @url)
      return false
    end

    load_sections(doc)

    @loaded = true
    @errors = []
    true
  end

  def search(text)
    srch = text.downcase
    open
    @search_results = []
    @sections.each do |section|
      section.articles.each do |article|
        in_artice = article.header.downcase.include?(srch)
        in_descriptione = article.description.downcase.include?(srch)
        @search_results << { section: section, article: article } if in_artice || in_descriptione
      end
    end
  end

  private

  def load_sections(doc)
    @section_hashes.each do |hash|
      if hash[:section_id]
        load_sections_with_id(doc, hash)
      elsif hash[:section_class]
        load_sections_with_class(doc, hash)
      else
        @sections << Section.new(doc, hash, nil)
      end
    end
  end

  def load_sections_with_id(doc, hash)
    mark_up_sections = doc.css('#' + hash[:section_id])
    mark_up_sections.each do |mark_up_section|
      section = Section.new(doc, hash, mark_up_section)
      @sections << section if section.valid
    end
  end

  def load_sections_with_class(doc, hash)
    mark_up_sections = doc.css('.' + hash[:section_class])
    mark_up_sections.each do |mark_up_section|
      section = Section.new(doc, hash, mark_up_section)
      @sections << section if section.valid
    end
  end
end
