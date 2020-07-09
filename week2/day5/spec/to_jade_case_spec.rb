require_relative '../lib/to_jade_case.rb'

describe "to_jade_case" do
  it "Should work for example" do
    str = "How can mirrors be real if our eyes aren't real";
    expect(str.toJadenCase()).to eq("How Can Mirrors Be Real If Our Eyes Aren't Real")
  end
end
