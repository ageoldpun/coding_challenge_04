require "suffix_histogram"

describe SuffixHistogram do
  describe "#count_words" do
  	it "Counts the last word of the line" do
      subject.count_words("Mr. Jones\nMr. Piper").should == "Jones 1\nPiper 1\n"
    end

    it "Adds a running total" do
      subject.count_words("Mr. Jones\nMs. Jones").should == "Jones 2\n"  
    end

    it "Sorts the results by frequency" do
      subject.count_words("Ms. Jones\nMr. Jones\nMr. Poop").should == "Jones 2\nPoop 1\n"
    end

    it "only returns the top 7 results" do
      subject.count_words("Boba A\nBobb B\nBobc C\nBobd D\nBobe E\nBobf F\nBobg G\nBobh H\nBobi I").should == "A 1\nB 1\nC 1\nD 1\nE 1\nF 1\nG 1\n"
    end
  end
end