require 'nokogiri'
require 'open-uri'

def get_nokogiri_doc(url)
  return Nokogiri::HTML(URI.open(url))
end

def get_cryptocurrencies()
  doc = get_nokogiri_doc("https://coinmarketcap.com/all/views/all/")
  results = []

  # Read the Nokogiri::Document to get each row of table
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
end


# Save data to the txt file : data.txt
def save_data
  list = get_cryptocurrencies()
  f = File.open("data/data.txt","w")
  # Get date update
  f.puts "-----------------------------------------------"
  f.puts "Data save at #{Time.now}"
  f.puts "-----------------------------------------------"
  f.puts list.inspect
  f.close
  puts "Data saved on data.txt"
end


# Print the results
# p get_cryptocurrencies()
save_data()
