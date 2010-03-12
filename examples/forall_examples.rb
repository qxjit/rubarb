require File.dirname(__FILE__) + "/spec_helper"

describe "forall" do
  it 'should call the block a configured number of times' do
    10.times do
      n = Arbitrary(Fixnum)
      times_called = 0

      Rubarb.with_config(:forall_amount => n) do
        ForAll(Fixnum) { times_called += 1}
      end

      times_called.should == n
    end
  end

  it 'should yield an arbitrary value of the given type' do
    [Fixnum, String].each do |klass|
      Rubarb.with_config(:forall_amount => 1) do
        ForAll(klass) { |o| o.should be_kind_of(klass) }
      end
    end
  end

  it 'should support nesting with_config' do
    ForAll(Fixnum) do |n|
      Rubarb.with_config(:forall_amount => n) do

        Rubarb.with_config(:forall_amount => 1) do
          Rubarb.config[:forall_amount].should == 1
        end

        Rubarb.config[:forall_amount].should == n
      end
    end
  end

  it 'should handle exceptions within with_config' do
    ForAll(Fixnum) do |n|
      begin
        Rubarb.with_config(:forall_amount => n) { raise "Error" }
      rescue RuntimeError
      end

      Rubarb.config[:forall_amount].should == Rubarb::DefaultConfig[:forall_amount]
    end
  end

  it 'should pass args on to Arbitrary' do
    ForAll(String) do |name|
      Rubarb.define(name) { |*args| args }
      (1..10).each do |n|
        ForAll(name, *(0..n).to_a) {|v| v.should == (0..n).to_a }
      end
    end
  end

  it 'should generate the same list each time' do
    list1 = []; ForAll(Fixnum) {|n| list1 << n}
    list2 = []; ForAll(Fixnum) {|n| list2 << n}
    list1.should == list2
  end
end
