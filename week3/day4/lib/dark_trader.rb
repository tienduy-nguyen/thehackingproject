require 'nokogiri'
require 'open-uri'

def get_nokogiri_doc(url)
  return Nokogiri::HTML(URI.open(url))
end

def get_cryptocurrencies()
  doc = get_nokogiri_doc("https://coinmarketcap.com/all/views/all/")
  results = {}

  doc.xpath('//table/tbody/tr').each do |row|
      crypto_node = row.at_xpath('td[contains(@class,"cmc-table__cell--sort-by__symbol")]')
      price_node = row.at_xpath('td[contains(@class,"cmc-table__cell--sort-by__price")]/a')
      crypto_text = crypto_node.children.text
      price_value = price_node.children.text[1..-1].gsub(/[^\d^.]/,'').to_f
      results[crypto_text] = price_value
  end
  return results
end

# Print the results
p get_cryptocurrencies()

