require_relative '../lib/app.rb'

describe "Test app" do
  it "Twitter api should be connected and return a client" do
    expect(login_twitter).not_to be_nil
  end
  
end
