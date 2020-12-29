require_relative '../lib/scraper'
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
