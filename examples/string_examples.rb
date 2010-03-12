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

  it 'should generate strings of varying length' do
    set = Set.new
    100.times { set << Arbitrary(String).length }
    set.size.should >= 50
  end

  it 'should use many printable characters' do
    printable_characters = (0..255).map {|c| "" << c}.select {|s| s =~ /[[:print:]]/}
    set = Set.new
    100.times { set.merge Arbitrary(String).split('') }
    set.size.should >= (printable_characters.length * 4 / 5)
  end
end
