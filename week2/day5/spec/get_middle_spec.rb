require "spec_helper"
require_relative "../lib/get_middle.rb"

describe "get_middle" do
  it "Should work for example" do
    expect(get_middle("test")).to eq("es")
    expect(get_middle("testing")).to eq("t")
    expect(get_middle("middle")).to eq("dd")
    expect(get_middle("A")).to eq("A")
    expect(get_middle("of")).to eq("of")
  end
end