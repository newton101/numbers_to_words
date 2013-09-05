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
  it 'converts double_digits to words' do
    convertor.to_words(1).should == "One"
  end

  context 'teens' do
    it 'converts irregular numbers to words' do
      convertor.to_words(10).should == "Ten"
      convertor.to_words(11).should == "Eleven"
      convertor.to_words(12).should == "Twelve"
    end
    it 'converts normal numbers to words' do
      convertor.to_words(13).should == "Thirteen"
      convertor.to_words(16).should == "Sixteen"
      convertor.to_words(19).should == "Nineteen"
      # 18 => eigtheen irregular?
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
end


  # context '#base_number?' do
  #   it 'returns true if number is between 0-9' do
  #     convertor.single_digit?(1).should be_true
  #   end
  #   it 'returns false if number is not between 0-9' do
  #     convertor.si(11).should be_false
  #   end
  # end