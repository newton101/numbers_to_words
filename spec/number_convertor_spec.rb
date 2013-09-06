require 'spec_helper'

describe NumberConvertor do
  let(:convertor) { NumberConvertor.new }

  it 'returns true if a single digit' do
    3.unit?.should == true
  end

  it 'returns true if a teen' do
    13.teens?.should == true
  end

  it 'returns true if a ten' do
    34.tens?.should == true
  end

  it 'converts single digits to words' do
    convertor.to_words(1).should == "One"
    convertor.to_words(3).should == "Three"
    convertor.to_words(7).should == "Seven"
  end
  it 'returns nothing for 0' do
    convertor.to_words(0).should == ""
  end
  it 'converts double_digits to words' do
    convertor.to_words(1).should == "One"
  end

  context 'teens' do
    it 'converts irregular numbers to words' do
      convertor.to_words(10).should == "Ten"
      convertor.to_words(12).should == "Twelve"
      convertor.to_words(16).should == "Sixteen"
      convertor.to_words(19).should == "Nineteen"
    end
  end
  context 'tens' do
    it 'converts numbers from 20-99 to words' do
      convertor.to_words(34).should == "Thirty Four"
      convertor.to_words(63).should == "Sixty Three"
      convertor.to_words(99).should == "Ninety Nine"
    end
  end
  context 'hundreds' do
    it 'converts numbers from 100-999 to words' do
      convertor.to_words(340).should == "Three hundred and Fourty"
      convertor.to_words(630).should == "Six hundred and Thirty"
      convertor.to_words(999).should == "Nine hundred and Ninety Nine"
    end
  end
  context 'greater than 999' do
    it 'converts numbers to words' do
      convertor.to_words(3400).should == "Three thousand Four hundred"
      convertor.to_words(60304).should == "Sixty thousand Three hundred and Four"
      convertor.to_words(999992).should == "Nine hundred and Ninety Nine thousand Nine hundred and Ninety Two"
      convertor.to_words(1000327).should == "One million Three hundred and Twenty Seven"
    end
  end
end
