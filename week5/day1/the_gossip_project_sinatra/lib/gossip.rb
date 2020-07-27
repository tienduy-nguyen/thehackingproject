require 'json'
require 'csv'
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
    potin["author"] = @author
    potin["content"]= @content
    gossips.push(potin)

    # Write potin in database file
    File.open('db/gossips.json','w') do |f|
      f.write(gossips.to_json)
    end
  end
 
  # Get all potins from databases
  def self.all
    file = File.read('db/gossips.json')
    return JSON.parse(file)
  end

end