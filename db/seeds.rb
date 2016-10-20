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
  page = Nokogiri::HTML(open("http://www.linguanaut.com/english_polish.htm")) 
  rows = page.xpath("//*[@id='rounded-corner']")
  
  rows_array = []

  rows.each do |tr|
    original_text = tr.search('td')[0].text
    translated_text = tr.search('td')[1].text
    rows_array << Card.create(original_text: original_text, translated_text: translated_text)
    row_new = Card.new(original_text: original_text, translated_text: translated_text)
    puts row_new
  end
end

fetch
