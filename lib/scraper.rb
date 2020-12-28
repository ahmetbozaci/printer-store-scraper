require 'nokogiri'
require 'open-uri'
require 'byebug'

  

# class Scrapper
#   attr_accessor :parsed_page

#   def initialize
#     url = "https://usa.banggood.com/Wholesale-Attribute-3D-Printer-c-10808-s-5347v13658.html"
#     unparsed_page = URI.open(url)
#     @parsed_page = Nokogiri::HTML(unparsed_page)
#   end

#   def get_name
#     @parsed_page.css("div.p-wrap")
#   end

#   def get_review
#   end

#   def get_price
#     @parsed_page.css("span.price").map do |price| 
#       price.text.gsub(/[A-Za-z,$,]/,"").to_f
#     end
#   end
  
# end


  def scraper
    url = "https://usa.banggood.com/Wholesale-Attribute-3D-Printer-c-10808-s-5347v13658.html"
    unparsed_page = URI.open(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    
    get_name =  parsed_page.css("div.p-wrap")
    get_review = parsed_page.css("a.review")
    get_price = parsed_page.css("span.price").map do |price| 
      price.text.gsub(/[A-Za-z]/,"").gsub(".00","")
    end
    # get_price_dollar = get_price.text.gsub(/[A-Za-z]/,"")
    byebug
  end

  scraper
