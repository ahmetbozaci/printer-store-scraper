require 'nokogiri'
require_relative "../lib/scraper.rb"

scraper = Scrapper.new
name = scraper.get_name
price = scraper.get_price

def display
  puts
  puts "This scraper show FDM printers from Bangood store"
  puts "If you want to sort them by name Press '1'"
  puts "If you want to sort them by review Press '2'"
  puts "If you want to sort them by price Press '3'"
end

def input(number)
  if number == 1
    puts ""
  elsif number == 2
    puts "" 
  elsif number == 3
    puts ""
  else 
    puts "Please just press correct number"
  end
end




