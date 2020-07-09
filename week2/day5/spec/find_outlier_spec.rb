require_relative('../lib/find_outlier.rb')

describe "find_outlier" do
  it "Should work for example" do
    expect(find_outlier([0, 1, 2])).to eq(1)
    expect(find_outlier([1, 2, 3])).to eq(2)
    expect(find_outlier([2,6,8,10,3])).to eq(3)

  end
  
end
