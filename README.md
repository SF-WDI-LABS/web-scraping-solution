# README

This repo serves as an example of how you could write a web scraping rake task.
There are only two differences between this repo and a basic `rails new` app:

* I used `rails g model` and migrated to create a basic `Sandal` model.
* I added a [rake task](lib/tasks/scraper.rake) that uses Nokogiri to scrape data.
