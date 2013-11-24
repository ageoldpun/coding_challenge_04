require "histogram"

describe Histogram do
  describe "#count_words" do
  	it "Counts the first word of the line" do
      subject.count_words("Mr. Jones\nMs. Jones").should == "Mr. 1\nMs. 1"
    end

    it "Adds a running total" do
      subject.count_words("Mr. Jones\nMr. Piper").should == "Mr. 2"
    end
  end
end