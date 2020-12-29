require_relative '../lib/scraper'

describe Scrapper do
  scraper = Scrapper.new
  describe 'take_name' do
    it 'has to return number of printers' do
      expect(scraper.take_name.count).to eql(47)
    end
  end

  describe 'take_price' do
    it 'this method has to return an Array' do
      expect(scraper.take_price.is_a?(Array)).to eql(true)
    end
  end

  describe 'take_review' do
    it 'has to return an array' do
      expect(scraper.take_review.is_a?(Array)).not_to eql(false)
    end
  end
end
