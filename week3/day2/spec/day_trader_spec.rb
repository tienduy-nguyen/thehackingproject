require_relative '../lib/day_trader.rb'

describe "day_trader" do
  it "Should workd for example" do
    expect(day_trader([17, 3, 6, 9, 15, 8, 6, 1, 10])).to eq([1,4])
    expect(day_trader([12, 2, 6, 9, 10, 8, 6, 1, 11])).to eq([7,8])
  end
  
end
