require File.dirname(__FILE__) + "/spec_helper"

describe Array do
  it "should only generate arrays" do
    ForAll(Array) do |array|
      array.should be_kind_of(Array)
    end
  end

  it "should generate arrays of the given type" do
    ForAll(:rubarb_generator) do |g|
      # rubarb_generator doesn't generate values of a consistent type...
      next if g == :rubarb_generator
      Arbitrary(Array, g).each do |item|
        item.should be_kind_of(Arbitrary(g).class)
      end
    end
  end
end
