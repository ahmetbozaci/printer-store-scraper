require 'nokogiri'
require 'open-uri'
require 'byebug'

class Scrapper
  attr_accessor :parsed_page

  def initialize
    url = 'https://usa.banggood.com/Wholesale-Attribute-3D-Printer-c-10808-s-5347v13658.html'
    unparsed_page = URI.parse(url).open
    @parsed_page = Nokogiri::HTML(unparsed_page)
  end

  def take_name
    parsed_page.css('a.title').map do |name|
      name.text[0..25]
    end
  end

  def take_review
    parsed_page.css('a.review').map do |review|
      review.text.gsub(/[A-Za-z]/, '').to_i
    end
  end

  def take_price
    parsed_page.css('span.price').map do |price|
      price.text.gsub(/[A-Za-z,$,]/, '').to_f
    end
  end

  def take_url
    printer_url = parsed_page.css('div.p-wrap')
    printer_url.map do |url|
      url.css('a')[0].attributes['href'].value
    end
  end
end

# def test
#   url = 'https://usa.banggood.com/Wholesale-Attribute-3D-Printer-c-10808-s-5347v13658.html'
#   unparsed_page = URI.parse(url).open
#   parsed_page = Nokogiri::HTML(unparsed_page)
#   printer_url = parsed_page.css('div.p-wrap').map
#   # printer_url.map do |url| url end
#   byebug
# end

# test
