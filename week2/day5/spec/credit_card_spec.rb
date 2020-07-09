require_relative '../lib/credit_card.rb'

describe "credit_card" do
  it "It should world for example" do
    expect(maskify('4556364607935616')).to eq('############5616')
    expect(maskify('1')).to eq('1')
    expect(maskify('11111')).to eq('#1111')
  end
end
