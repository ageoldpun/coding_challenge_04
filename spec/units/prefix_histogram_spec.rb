require "prefix_histogram"

describe PrefixHistogram do
  describe "#count_words" do
  	it "Counts the first word of the line" do
      subject.count_words("Mr. Jones\nMs. Jones").should == "Mr. 1\nMs. 1\n"
    end

    it "Adds a running total" do
      subject.count_words("Mr. Jones\nMr. Piper").should == "Mr. 2\n"
    end

    it "Sorts the results by frequency" do
      subject.count_words("Ms. Piper\nMr. Jones\nMr. Poop").should == "Mr. 2\nMs. 1\n"
    end

    it "only returns the top 7 results" do
      subject.count_words("Boba Piper\nBobb Jones\nBobc Poop\nBobd Piper\nBobe Jones\nBobf Poop\nBobg Piper\nBobh Jones\nBobi Poop").should == "Boba 1\nBobb 1\nBobc 1\nBobd 1\nBobe 1\nBobf 1\nBobg 1\n"
    end
  end
end