# Pro tip: run this with 'rake scraper:wsandals'
require 'open-uri'
namespace :scraper do
  desc "Helpful scraping scripts"
  task wsandals: :environment do
    # This rake task scrapes the women's sandals data and adds it to the database.
    doc = Nokogiri::HTML(open('https://www.rainbowsandals.com/products-all/womens/sandals/'))
    BASE_URL = "https://www.rainbowsandals.com"
    doc.css('.itemListing').each do |listing|
      name = listing.at_css('.itemPictureDescription').text.strip
      pid = listing.at_css('.itemNumber').text.strip.split(' ').last
      price = listing.at_css('.yourPrice').text.strip.split('$').last.split('.').first
      price = price.to_i
      Sandal.create(title: name, product_id: pid, price: price)
      # This code is an example of how you could follow individual links, if
      #   your preferred manufacturer doesn't have enough info on the main page.
      # First, find the url you want to follow; then, open that product's info,
      #   and pull out whatever you need.

      # p_url = listing.at_css('.itemIdentification').attribute('onclick').value.split('"').last
      # full_url = BASE_URL + p_url
      # product_doc = Nokogiri::HTML(open(full_url))
    end
  end
end
