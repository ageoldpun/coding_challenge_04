require "suffix_histogram"

describe SuffixHistogram do
  describe "#count_words" do
  	it "Counts the last word of the line" do
      subject.count_words("Mr. Jones\t(352) 563-0832\nMr. Piper\t(352) 563-0832").should == "Jones 1\nPiper 1\n"
    end

    it "Adds a running total" do
      subject.count_words("Mr. Jones\t(352) 563-0832\nMs. Jones\t(352) 563-0832").should == "Jones 2\n"  
    end

    it "Sorts the results by frequency" do
      subject.count_words("Ms. Jones\t352.563-0832\nMr. Jones\t(352) 563-0832\nMr. Poop\t(352) 563-0832").should == "Jones 2\nPoop 1\n"
    end

    it "only returns the top 11 results" do
      subject.count_words("Boba A\t(352) 563-0832\nBobb B\t(352) 563-0832\nBobc C\t(352) 563-0832\nBobd D\t(352) 563-0832\nBobe E\t(352) 563-0832\nBobf F\t(352) 563-0832\nBobg G\t(352) 563-0832\nBobh H\t(352) 563-0832\nBobi I\t(352) 563-0832\nBobj J\t(352) 563-0832\nBobk K\t(352) 563-0832\nBobl L\t(352) 563-0832\nBobm M\t(352) 563-0832\nBobn N\t(352) 563-0832").should == "A 1\nB 1\nC 1\nD 1\nE 1\nF 1\nG 1\nH 1\nI 1\nJ 1\nK 1\n"
    end

    it "returns the last portion of the name, not the phone number" do
      subject.count_words("Bob Dole Sr.\t(352) 563-0832").should == "Sr. 1\n"
    end
  end
end