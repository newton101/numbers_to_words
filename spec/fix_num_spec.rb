require 'spec_helper'

describe Fixnum do

  context '#unit?' do
    it 'returns true if number is a single digit' do
      3.unit?.should == true
    end
    it 'returns false if number is not a single digit' do
      13.unit?.should == false
    end
  end

  context '#teens?' do
    it 'returns true if number is between 10-19' do
      16.teens?.should == true
    end
    it 'returns false if number is not between 10-19' do
      34.teens?.should == false
    end
  end

  context '#tens?' do
    it 'returns true if number is between 20-99' do
      41.tens?.should == true
    end
    it 'returns false if number is not between 20-99' do
      276.tens?.should == false
    end
  end

  context '#hundreds?' do
    it 'returns true if number is between 100-999' do
      645.hundreds?.should == true
    end
    it 'returns false if number is not between 100-999' do
      64.hundreds?.should == false
    end
  end

  context '#to_tens?' do
    it 'returns the ten-based number for that number' do
      23.to_tens.should == 20
      47.to_tens.should == 40
    end
  end

  context '#to_hundreds?' do
    it 'returns the hundred-based number for that number' do
      123.to_hundreds.should == 100
      473.to_hundreds.should == 400
      986.to_hundreds.should == 900
    end
  end

  context '#integer_size' do
    it 'returns the number of digits for that number' do
      123.integer_size == 3
      12345.integer_size == 5
      1234567.integer_size == 7
    end
  end
end