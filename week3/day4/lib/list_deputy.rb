require 'nokogiri'
require 'open-uri'

def get_nokogiri_doc(url)
  return Nokogiri::HTML(URI.open(url))
end

def get_info_deputy(url)
  doc = get_nokogiri_doc(url)
  full_name_node = doc.xpath('//h1').last
  email_node = doc.xpath('//a[contains(@href,"mailto")]').last
  full_name = full_name_node.text
  email = email_node.text

  hash = Hash.new
  hash["first_name"] = full_name.split()[1]
  hash["last_name"] = full_name.split()[2]
  hash["email"] = email
  return hash
end

def get_result_all_city(url)
  doc = get_nokogiri_doc(url)
  all_deputy_node = doc.xpath('//ul/li/a[contains(@href,"deputes")]')
  all_deputy_node.each do |deputy|
    puts deputy.content

  end
  # results = []
  # all_city_node.each do |city_node|
  #   city_html = city_node.content
  #   info = get_info_townhall(url+city_html)
  #   results.push(info)
  # end
 
  # return results
end

# Save data to the txt file : data.txt
def save_data
  list = get_result_all_city('https://www.annuaire-des-mairies.com/95/')
  f = File.open("data/deputy.txt","w")
  # Get date update
  f.puts "-----------------------------------------------"
  f.puts "Data save at #{Time.now}"
  f.puts "-----------------------------------------------"

  list.select {|crypto|
    crypto.each {|k,v| f.puts "#{k} : #{v}"} 
  }
  
  f.close
  puts "Data saved on deputy.txt"
end


# p get_info_deputy('http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA719842')
p get_result_all_city('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique')
# save_data()