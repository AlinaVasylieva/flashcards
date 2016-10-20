# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'nokogiri'
require 'open-uri'

def fetch
  page = Nokogiri::HTML(open("http://www.languagedaily.com/learn-german/vocabulary/common-german-words")) 
  rows = page.xpath("//*[@id='jsn-mainbody']/div[2]/div/div[1]/table")

  rows_array = []

  rows.each do |tr|
    original_text = tr.all('td')[1].text
    translated_text = tr.all('td')[2].text
    rows_array << Сard.create(original_text, translated_text)

  end
end

fetch.new
