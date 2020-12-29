require 'nokogiri'
require_relative '../lib/scraper'
require_relative '../lib/information'

def variables
  scraper = Scrapper.new
  name = scraper.take_name
  price = scraper.take_price
  review = scraper.take_review
  url = scraper.take_url
  printer_list = []
  name.count.times { printer_list.push([]) }
  name.count.times { |index| printer_list[index].push(name[index], price[index], review[index], url[index]) }
  printer_list
end

def show(list)
  variables
  variables.count.times do |i|
      puts
      puts "                  PRINTER-#{i+1}"
      puts
      puts "  PRINTER NAME :  #{list[i][0]}"
      puts
      puts "  PRICE($)     :  #{list[i][1]}"
      puts
      puts "  REVIEW       :  #{list[i][2]}"
      puts 
      puts "  URL          :  #{list[i][3]}"
      puts
      puts "  -----------------------------------------"
  end
 
end
def input
  number = gets.chomp.to_i
  puts
  print 'Sort the list high to low? (Y/N): '
  letter = gets.chomp.upcase
  puts
  puts 'Please wait...'
  numbers = [1, 2]
  variables
  result = variables.sort_by { |list| list[number] }
  result.reverse! if letter == 'Y'
  numbers.include?(number) ?  show(result) : (puts 'you entered wrong number')
end

display
input



