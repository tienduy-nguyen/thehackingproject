require 'json'
require 'csv'
class Gossip
  attr_accessor :author, :content
  def initialize(author, content)
    @author = author
    @content = content
  end

  Using CSV
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << ["Mon super auteur", "Ma super description"]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

end