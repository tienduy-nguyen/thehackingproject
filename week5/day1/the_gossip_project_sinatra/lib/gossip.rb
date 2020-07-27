require 'json'
require 'csv'
require 'securerandom'

class Gossip
  attr_accessor :author, :content
  def initialize(author, content)
    @author = author
    @content = content
  end

   # Save to database
  def save
    gossips = []
    # Check database file exist
    if File.file?('db/gossips.json') 
      # Read json file
      file = File.read('db/gossips.json')
      gossips = JSON.parse(file)
    end
    
    # Creat new potin from the submit form
    potin = Hash.new
    create_at = Time.now.strftime("%d/%m/%y %k:%M:%S")
    update_at = create_at
    id = SecureRandom.uuid
    potin["id"] = id
    potin["author"] = @author
    potin["content"]= @content
    potin["create_at"]=create_at
    potin["update_at"]=create_at
    potin["comments"] = []

    gossips.push(potin)

    # Write potin in database file
    File.open('db/gossips.json','w') do |f|
      f.write(gossips.to_json)
    end
  end
  def self.save_new(array)
    File.open('db/gossips.json','w') do |f|
      f.write(array.to_json)
    end
  end
 
  # Get all potins from databases
  def self.all
    file = File.read('db/gossips.json')
    return JSON.parse(file)
  end

  def self.find(id)
    return self.all[id]
  end

  def self.find_by_uuid(uuid)
    return self.all.select{|x| x['id'] == uuid}[0]
  end

end