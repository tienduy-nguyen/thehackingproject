require_relative '../lib/list_deputy.rb'

describe "City list" do
  dictionary = get_result_all_deputy('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique').reduce Hash.new, :merge
  it "Result not be nill" do
    expect(dictionary).not_to be_nil
    expect(dictionary.empty?).to be false
  end
end
