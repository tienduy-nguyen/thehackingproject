require_relative('../lib/open_or_senior.rb')

describe "open_or_senior" do
  it "Should work for example" do
    expect(open_or_senior([[45, 12],[55,21],[19, -2],[104, 20]])).to eq(['Open', 'Senior', 'Open', 'Senior'])
    expect(open_or_senior([[3, 12],[55,1],[91, -2],[54, 23]])).to eq(['Open', 'Open', 'Open', 'Open'])
    expect(open_or_senior([[59, 12],[55,-1],[12, -2],[12, 12]])).to eq(['Senior', 'Open', 'Open', 'Open'])
    expect(open_or_senior([[16, 23],[73,1],[56, 20],[1, -1]])).to eq(['Open', 'Open', 'Senior', 'Open'])
  end
end
