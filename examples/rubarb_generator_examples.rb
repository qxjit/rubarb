require File.dirname(__FILE__) + "/spec_helper"

describe :rubarb_generator do
  it "should only generate rubarb generators" do
    ForAll(:rubarb_generator) do |g|
      lambda { Arbitrary(g) }.should_not raise_error
    end
  end

  it "should be sufficiently random" do
    set = Set.new
    Rubarb.generators.size.times { set << Arbitrary(:rubarb_generator) }
    set.size.should >= (Rubarb.generators.size / 2)
  end
end
