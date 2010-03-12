require File.dirname(__FILE__) + "/spec_helper"

describe String do
  it "should only generate Strings" do
    ForAll(String) { |s| s.should be_kind_of(String) }
  end

  it "should generate sufficiently random strings" do
    set = Set.new
    100.times { set << Arbitrary(String) }
    set.size.should >= 99
  end
end
