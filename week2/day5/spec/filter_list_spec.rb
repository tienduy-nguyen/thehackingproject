require_relative '../lib/filter_list.rb'

describe "filter_list" do
  it "Should work for example" do
    expect(filter_list([1,2,'a','b'])).to eq([1,2])
    expect(filter_list([1,'a','b',0,15])).to eq([1,0,15])
    expect(filter_list([1,2,'aasf','1','123',123])).to eq([1,2,123])
  end
end