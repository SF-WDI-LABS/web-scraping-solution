namespace :scraper do
  desc "Helpful scraping scripts"
  task wsandals: :environment do
    doc = Nokogiri::HTML(open('https://www.rainbowsandals.com/products-all/womens/sandals/'))
    BASE_URL = "https://www.rainbowsandals.com"
    doc.css('.itemListing').each do |listing|
      # find the url that i'll follow
      p_url = listing.at_css('.itemIdentification').attribute('onclick').value.split('"').last
      full_url = BASE_URL + p_url
      product_doc = Nokogiri::HTML(open(full_url))
      name = listing.at_css('.itemPictureDescription').text.strip
      pid = listing.at_css('.itemNumber').text.strip.split(' ').last
      price = listing.at_css('.yourPrice').text.strip.split('$').last.split('.').first
      price = price.to_i
      Sandal.create(title: name, product_id: pid, price: price)
    end
  end
end
