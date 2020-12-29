require 'nokogiri'
require_relative '../lib/scraper'
require_relative '../lib/information'
require 'byebug'


def variables
  scraper = Scrapper.new
  name = scraper.take_name
  price = scraper.take_price
  review = scraper.take_review
  printer_list = []
  name.count.times { printer_list.push([]) }
  name.count.times { |index| printer_list[index].push(name[index], price[index], review[index]) }
  printer_list
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
  show_result = result.size.times do |i|
    text
    puts "#{i + 1} -- #{result[i]}"
  end
  numbers.include?(number) ? show_result : (puts 'you entered wrong number')
end
display
input
