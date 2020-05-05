require 'nokogiri'
require 'open-uri'
require_relative '../lib/utils'
require_relative '../lib/source'
require_relative '../lib/section'
require_relative '../lib/article'
require_relative '../resources/newsweek'

RSpec.describe NewsWeek do
  newsweek_hash = {}
  newsweek_hash.extend(NewsWeek)

  describe '#setup' do
    it 'returns true if a hash extending NewsWeek responds to the setup method' do
      expect(newsweek_hash.respond_to?(:setup)).to be true
    end
  end
end

newsweek_hash = {}
newsweek_hash.extend(NewsWeek)
newsweek_hash.setup
newsweek = Source.new(newsweek_hash)
newsweek.open

RSpec.describe Source do
  describe '#open' do
    google = Source.new({ caption: 'GitHub', url: 'https://www.github.com', section_hashes: [] })
    google.open
    it 'Opens GitHub whithout errors' do
      expect(google.errors.count.zero?).to be true
    end

    foo = Source.new({ caption: 'foo.com', url: 'foo.com' })
    foo.open
    it 'Source contains Errors if can not open the given URL' do
      expect(foo.errors.count.positive?).to be true
    end
  end

  describe '#sections' do
    it 'returns true if sections found in NewsWeek' do
      expect(newsweek.sections.count.positive?).to be true
    end
  end
end

RSpec.describe Section do
  describe '#title' do
    search_str = 'FEATURED STORIES'
    it "returns true if a section titled \'#{search_str}\' is found" do
      expect(newsweek.sections.any? { |section| section.title == search_str }).to be true
    end
  end

  describe '#articles' do
    it 'returns true if all sections contain some articles' do
      expect(newsweek.sections.none? { |section| section.articles.count.zero? }).to be true
    end
  end
end

RSpec.describe Article do
  describe '#header' do
    header_search = []
    header_search << 'Corona'
    header_search << 'Trump'
    header_search << 'Hospital'

    search_str = header_search[0]
    it "returns true if \'#{search_str}\' is found in any article header of all sections" do
      expect(newsweek.sections.any? do |section|
        section.articles.any? { |article| article.header.include?(search_str) }
      end).to be true
    end

    search_str = header_search[1]
    it "returns true if \'#{search_str}\' is found in any article header of all sections" do
      expect(newsweek.sections.any? do |section|
        section.articles.any? { |article| article.header.include?(search_str) }
      end).to be true
    end

    search_str = header_search[2]
    it "returns true if \'#{search_str}\' is found in any article header of all sections" do
      expect(newsweek.sections.any? do |section|
        section.articles.any? { |article| article.header.include?(search_str) }
      end).to be true
    end
  end

  describe '#description' do
    description_search = []
    description_search << 'world'
    description_search << 'company'
    description_search << 'pandemic'

    search_str = description_search[0]
    it "returns true if \'#{search_str}\' is found in any article description of all sections" do
      expect(newsweek.sections.any? do |section|
        section.articles.any? { |article| article.description.include?(search_str) }
      end).to be true
    end

    search_str = description_search[1]
    it "returns true if \'#{search_str}\' is found in any article description of all sections" do
      expect(newsweek.sections.any? do |section|
        section.articles.any? { |article| article.description.include?(search_str) }
      end).to be true
    end

    search_str = description_search[2]
    it "returns true if \'#{search_str}\' is found in any article description of all sections" do
      expect(newsweek.sections.any? do |section|
        section.articles.any? { |article| article.description.include?(search_str) }
      end).to be true
    end
  end
end
