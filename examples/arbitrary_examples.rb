require File.dirname(__FILE__) + "/spec_helper"

describe "Arbitrary" do
  it 'should return the value of the configured block' do
    ForAll(String) do |name|
      value = Arbitrary(String)
      Rubarb.define(name) { value }
      Arbitrary(name).should == value
    end
  end

  it 'should pass arguments on to block' do
    ForAll(String) do |name|
      actual_args = nil
      Rubarb.define(name) { |*args| actual_args = args }
      expected_args = (0..Arbitrary(Fixnum)).to_a

      Arbitrary(name, *expected_args)

      actual_args.should == expected_args
    end
  end
end
