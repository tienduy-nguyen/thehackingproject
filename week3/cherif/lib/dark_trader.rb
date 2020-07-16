
require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
doc = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))

doc.xpath('//table/tbody/tr').each do |row|
  # In each row, we will get the infomations we need
    crypto_name_node = row.at_xpath('td[contains(@class,"cmc-table__cell--sort-by__symbol")]')
    price_node = row.at_xpath('td[contains(@class,"cmc-table__cell--sort-by__price")]/a')
    crypto_name = crypto_name_node.children.text
    price_value = price_node.children.text[1..-1].gsub(/[^\d^.]/,'').to_f # convert humain number string to fload
    
    # Push hash to an array
    cryptocurrency = Hash.new
    cryptocurrency[crypto_name] = price_value
    results.push(cryptocurrency)
end
return results