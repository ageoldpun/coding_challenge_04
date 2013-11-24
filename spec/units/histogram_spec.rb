require "histogram"

describe Histogram do
  describe "#count_words" do
  	it "inputs a string and outputs a string" do
      histogram = Histogram.new
      histogram.count_words("Mr. Jones\nMs. Jones").should == "Mr. 1\nMs. 1"
    end
  end
end