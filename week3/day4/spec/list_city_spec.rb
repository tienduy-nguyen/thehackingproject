require_relative '../lib/list_city.rb'

describe "City list" do
  dictionary = get_result_all_city('https://www.annuaire-des-mairies.com/95/').reduce Hash.new, :merge
  it "Result not be nill" do
    expect(dictionary).not_to be_nil
    expect(dictionary.empty?).to be false
  end
  it "Check present of some city" do
    expect(dictionary.include?("ABLEIGES - 95450")).to be true
    expect(dictionary.include?("AINCOURT - 95510")).to be true
  end
  it "Price must be string" do
    expect(dictionary.values.any?{|i| i.is_a?(String)}).to be true
  end
  
end
