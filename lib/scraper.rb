require 'nokogiri'
require 'open-uri'
require 'byebug'

class Scrapper
  attr_accessor :parsed_page

  def initialize
    url = 'https://usa.banggood.com/Wholesale-Attribute-3D-Printer-c-10808-s-5347v13658.html'
    unparsed_page = URI.open(url)
    @parsed_page = Nokogiri::HTML(unparsed_page)
  end

  def take_name
    @parsed_page.css('a.title').map do |name|
      name.text[0..25]
    end
  end

  def take_review
    @parsed_page.css('a.review').map do |review|
      review.text.gsub(/[A-Za-z]/, '').to_i
    end
  end

  def take_price
    @parsed_page.css('span.price').map do |price|
      price.text.gsub(/[A-Za-z,$,]/, '').to_f
    end
  end
end
