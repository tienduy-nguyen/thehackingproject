require 'json'

class Gossip
  attr_reader :author, :content
  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    file = File.read('db/gossip.json')
    data_hash = JSON.parse(file)
    potin = Hash.new
    potin[@author] = @content
    data_hash.push(potin)

    File.open('db/gossip.json','w') do |f|
      f.write(data_hash.to_json)
    end
  end
  def self.all
    file = File.read('db/gossip.json')
    return JSON.parse(file)
  end
end