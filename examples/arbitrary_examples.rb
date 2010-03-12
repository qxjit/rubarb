require File.dirname(__FILE__) + "/spec_helper"

describe "Arbitrary" do
  it 'should return the value of the configured block' do
    ForAll(String) do |name|
      value = Arbitrary(String)
      Rubarb.define(name) { value }
      Arbitrary(name).should == value
    end
  end
end
