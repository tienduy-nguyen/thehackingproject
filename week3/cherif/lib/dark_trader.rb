require 'nokogiri'
require 'open-uri'


# Boucle pour chaque ligne de crypto
def get_cryto
  doc = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
  results = []
  doc.xpath('//table/tbody/tr').each do |row|
    # Accéeder colonnes qu'on n'a besoin 
    cryto_name_node = row.at_xpath('td[contains(@class,"cmc-table__cell--sort-by__symbol")]')
    price_node = row.at_xpath('td[contains(@class,"cmc-table__cell--sort-by__price")]/a')
  
    cryto_name = cryto_name_node.text
    price = price_node.text[1..-1]
  
    hash  =  Hash.new
    hash[cryto_name] = price
    results.push(hash)
    
  end
  return results
end

p get_cryto

