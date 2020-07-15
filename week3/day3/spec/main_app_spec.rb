require_relative '../lib/main_app.rb'

describe "Test Main App" do
  it "Twitter api should be connected and return a client" do
    expect(login_twitter).not_to be_nil
  end

  it "Test the present of journalist list" do
    expect(get_journalists).to be_an_instance_of(Array)
    expect(get_journalists.empty?).to be false
    expect(get_journalists.size).to be >= 5
  end

  it "Test get random of journalist" do
    list = get_journalists
    expect(get_random(list)).to be_an_instance_of(Array)
    expect(get_random(list).size).to eq(5)
    expect(get_random(list).first.include?('@')).to be true
  end
  
end
