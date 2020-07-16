require_relative '../lib/dark_trader.rb'

describe "Dark Trader" do
  it "Result must be an hashes" do
    expect(get_cryptocurrencies).to be_an_instance_of(Array)
  end
  it "Result not be nill" do
    expect(get_cryptocurrencies).not_to be_nil
    expect(get_cryptocurrencies.empty?).to be false
  end
  it "Check the cryptocurrencies" do
    dictionary = get_cryptocurrencies.reduce Hash.new, :merge
    expect(dictionary.include?("BTC")).to be true
    expect(dictionary.include?("ETH")).to be true
  end
  it "Check no empty valus in results" do
    dictionary = get_cryptocurrencies.reduce Hash.new, :merge
    expect(dictionary.values.any?{|i| i.to_s.empty?}).to be false
  end
  it "Price must be contain only numbers" do
    dictionary = get_cryptocurrencies.reduce Hash.new, :merge
    expect(dictionary.values.any?{|i| i.is_a?(Float)}).to be true
  end
  
end
