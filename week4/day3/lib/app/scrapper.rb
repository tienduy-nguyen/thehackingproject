
require 'nokogiri'
require 'open-uri'
require 'json'
require 'csv'
require 'google_drive'

class Scrapper
  def get_nokogiri_doc(url)
    return Nokogiri::HTML(URI.open(url))
  end
  
  def get_info_townhall(url)
    start = Time.now
    doc = get_nokogiri_doc(url)
  
    # Get Nokogiri node
    city_name_node = doc.xpath('//h1').last
    city_email_node = doc.xpath('//table/tbody/tr[4]/td[2]').first
  
  
    # Get info
    begin
      city_name = city_name_node.text
      city_email = city_email_node.text
  
      hash = Hash.new
      hash[city_name] = city_email
    rescue => exception
      puts "An error has occured"
    end 
  
    # Count timer execution
    finish = Time.now
    puts "Time for scrapping data of #{city_name}: #{(finish-start).round(3)}"
    return hash
  end
  
  
  def get_result_all_city
    url = 'https://www.annuaire-des-mairies.com/95/'
    doc = get_nokogiri_doc(url)
    all_city_node = doc.xpath('//a[contains(.,".html")]')
    results = []
    all_city_node.each do |city_node|
      city_html = city_node.content
      info = get_info_townhall(url+city_html)
      results.push(info)
    end
    return results
  end

  
  # Save_json_file
  def save_as_json
    result = get_result_all_city()
    File.open("db/city.json","w") do |f|
      f.write(result.to_json)
    end
  end

  # Save data to csv file
  def save_as_csv
    result = get_result_all_city()
    begin
      CSV.open("db/city.csv", "wb") do |csv|
        result.each do |city|
          convert = city.to_a
          csv << convert[0]
        end
      end
    rescue => exception
      puts "Some errors have orcurred!"
    end
  end

  def save_data_to_google_drive

  end

  def perform(type_db)
    case type_db
    when "json"
      save_as_json
    when "google_drive"
      save_data_to_google_drive
    else
      save_as_csv
    end
    
    # # save_data()
    
  end
end