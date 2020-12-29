require 'nokogiri'

require_relative '../lib/information'

def display
  puts
  puts 'This scraper show FDM printers from Bangood store'
  puts
  puts 'If you want to sort them by price Press "1"'
  puts
  puts 'If you want to sort them by review Press "2"'
  puts
  puts 'List will be automatically sort low  to high.'
  puts
  print 'Price or Review: '
end
display

def show(list)
  variables
  variables.count.times do |i|
    puts
    puts "                  PRINTER-#{i + 1}"
    puts
    puts "  PRINTER NAME :  #{list[i][0]}"
    puts
    puts "  PRICE($)     :  #{list[i][1]}"
    puts
    puts "  REVIEW       :  #{list[i][2]}"
    puts
    puts "  URL          :  #{list[i][3]}"
    puts
    puts '  -----------------------------------------'
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
  numbers.include?(number) ? show(result) : (puts 'you entered wrong number')
end

input
