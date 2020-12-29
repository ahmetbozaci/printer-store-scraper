require_relative '../lib/scraper.rb'

describe Scrapper do
  scraper = Scrapper.new
  describe 'take_name' do
    it 'has to return size of number' do
      expect(scraper.take_name.size).to eql(47)
    end
  end

  describe 'take_price' do
    it 'has to return prices in array' do
      expect(scraper.take_price.is_a?(Array)).to eql(true)
    end
  end

  describe 'take_review' do
    it 'has to return prices in array' do
      expect(scraper.take_review.is_a?(Array)).not_to eql(false)
    end
  end
end
