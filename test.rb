require 'nokogiri'
# require 'httparty'
require 'open-uri'
require 'byebug'

class Scraper
  attr_accessor :parsed_page

  def initialize
    url = "https://www.monster.com/jobs/search/Full-Time_8?q=Software-Engineer&intcid=skr_navigation_nhpso_searchMain&tm=14&stpage=1&"
    unparsed_page = URI.open(url)
    @parsed_page = Nokogiri::HTML(unparsed_page)
  end

  def jobs_list
    @parsed_page.css("div.summary")
  end
  
  def total_job
    @parsed_page.css("h2.figure").text
  end
  
  def method
    jobs = Array.new
    jobs_list.each do |job|
      x = {
        title: job.css("h2.title").text,
        company: job.css("div.company").css("span.name").text,
        location: job.css("div.location").css("span.name").text
      }
      y = Hash.new
      x.map{|key,value| y[key] = value.strip}
      jobs.push(y)
      
    end
    jobs
  end
  byebug
end
 


# def scraper_method
  
#   jobs = parsed_page.css("div.summary")
#   total_job = parsed_page.css("h2.figure").text
#   total = total_job.strip.gsub("(","").to_i
#   last_page = (total / jobs.count.to_f).ceil 
#   job_list = Array.new
#   page = 1
#   while page <= 1
#     new_url = "https://www.monster.com/jobs/search/Full-Time_8?q=Software-Engineer&intcid=skr_navigation_nhpso_searchMain&tm=14&stpage=1&page=#{page}"
#     puts "Page: #{page}"
#     new_uparsed_page = URI.open(new_url)
#     new_parse_page = Nokogiri::HTML(new_uparsed_page)
#     new_jobs = new_parse_page.css("div.summary")
#     new_jobs.each do |job|
#       x = {
#         title: job.css("h2.title").text,
#         company: job.css("div.company").css("span.name").text,
#         location: job.css("div.location").css("span.name").text
#       }
#       y = Hash.new
#       x.map{|key,value| y[key] = value.strip}
#       job_list.push(y)
#       puts "name-company -location"
#       puts "name : #{y[:title]} - #{y[:company]} - #{y[:location]} "


      
#     end
#     page += 1
#   end

# end





require_relative '../lib/scraper.rb'
require 'nokogiri'
# require 'open-uri'
require 'byebug'

scraper = Scraper.new

# puts scraper.jobs_list
puts scraper.total_job


def scraper_method
  
  # jobs = parsed_page.css("div.summary")
  # total_job = parsed_page.css("h2.figure").text
  total = scraper.total_job.strip.gsub("(","").to_i
  # last_page = (total / jobs.count.to_f).ceil 
  # job_list = Array.new
  # page = 1
  # while page <= 1
  #   new_url = "https://www.monster.com/jobs/search/Full-Time_8?q=Software-Engineer&intcid=skr_navigation_nhpso_searchMain&tm=14&stpage=1&page=#{page}"
  #   puts "Page: #{page}"
  #   new_uparsed_page = URI.open(new_url)
  #   new_parse_page = Nokogiri::HTML(new_uparsed_page)
  #   new_jobs = new_parse_page.css("div.summary")
  #   new_jobs.each do |job|
  #     x = {
  #       title: job.css("h2.title").text,
  #       company: job.css("div.company").css("span.name").text,
  #       location: job.css("div.location").css("span.name").text
  #     }
  #     y = Hash.new
  #     x.map{|key,value| y[key] = value.strip}
  #     job_list.push(y)
  #     puts "name-company -location"
  #     puts "name : #{y[:title]} - #{y[:company]} - #{y[:location]} "


      
  #   end
  #   page += 1
  # end

end

puts scraper_method