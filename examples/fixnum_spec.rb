require File.dirname(__FILE__) + "/spec_helper"

describe Fixnum do
  it "should only generate Fixnums" do
    100.times do
      Arbitrary(Fixnum).should be_kind_of(Fixnum)
    end
  end

  it "should generate sufficiently random fixnums" do
    set = Set.new
    100.times { set << Arbitrary(Fixnum) }
    set.size.should >= 95
  end
end
