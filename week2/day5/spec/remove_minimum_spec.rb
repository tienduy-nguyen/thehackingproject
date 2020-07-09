require 'spec_helper'
require_relative '../lib/remove_minimum.rb'

describe "remove_smallest" do
  it "works for the examples" do
    expect(remove_smallest([1, 2, 3, 4, 5])).to eq([2, 3, 4, 5])
    expect(remove_smallest([5, 3, 2, 1, 4])).to eq([5, 3, 2, 4])
    expect(remove_smallest([2, 2, 1, 2, 1])).to eq([2, 2, 2, 1])
    expect(remove_smallest([])).to eq([])
  end
  
  def randarray()
    (1..rand(1..10)).map{rand(1..400)}
  end
  
  it "returns [] if array has only one element" do
    10.times do
      x = rand(1..400)
      expect(remove_smallest([x])).to eq([])
    end
  end
  
  it "returns an array that misses only one element" do
    10.times do
      arr = randarray()
      expect(remove_smallest(arr.dup).length).to eq(arr.length - 1)
    end
  end
end