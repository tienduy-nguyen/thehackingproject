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
  
  puts "Loading #{full_name} ......."

  hash = Hash.new
  hash["first_name"] = full_name.split()[1]
  hash["last_name"] = full_name.split()[2]
  begin
    email = email_node.text
    hash["email"] = email
    
  rescue => exception
    hash["email"] = "unknown"
    puts "An error has occured with email of #{full_name}"
  end
  
  return hash
end

def get_result_all_deputy(url)
  doc = get_nokogiri_doc(url)
  results = []
  base_url = "http://www2.assemblee-nationale.fr"
  all_deputy_node = doc.xpath('//ul/li/a[contains(@href,"deputes")]/@href')
  all_deputy_node.each do |deputy|
      info = get_info_deputy(base_url+deputy)
      results.push(info)
  end
  return results
end

# Save data to the txt file : data.txt
def save_data
  list = get_result_all_deputy('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique')
  f = File.open("data/deputy.txt","w")
  # Get date update
  f.puts "-----------------------------------------------"
  f.puts "Data save at #{Time.now}"
  f.puts "-----------------------------------------------"
  f.puts list.inspect
  f.close
  puts "Data saved on deputy.txt"
end


# p get_info_deputy('http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA719842')
p get_result_all_deputy('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique')
# save_data()