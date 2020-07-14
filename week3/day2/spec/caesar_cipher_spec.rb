require_relative('../lib/caesar_cipher.rb')

describe "casear_cipher" do
  it "Should work for example" do
    expect(caesar_cipher('What a string!',5)).to eq("Bmfy f xywnsl!")
    expect(caesar_cipher('Hello',1)).to eq("Ifmmp")
    expect(caesar_cipher('Hi!!!',0)).to eq("Hi!!!")
  end
  it "Check for non alphabet" do
    expect(caesar_cipher("36~###[#[]]",10)).to eq("36~###[#[]]")
  end
  it "Check respect the case and special charaters" do
    expect(caesar_cipher("aaaBA...??@##",2)).to eq("cccDC...??@##")
  end
  
end
