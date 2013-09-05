class Fixnum
  def unit?
    (0..9).cover? self
  end

  def teens?
    (10..19).cover? self
  end

  def tens?
    (20..99).cover? self
  end

  def to_tens
    if self.tens?
      ten_number = self.to_s[0]
      (ten_number + "0").to_i
    else
      raise 'Cannot convert this number'
    end
  end
end

class NumberConvertor
  UNITS = {0 => "Zero", 1 => "One", 2 => "Two", 3 => "Three", 4 => "Four", 5 => "Five", 6 => "Six", 7 => "Seven", 8 => "Eight", 9 => "Nine"}
  IRREGULAR_TEENS = {10 => "Ten", 11 => "Eleven", 12 => "Twelve", 13 => "Thirteen", 15 => "Fifteen", 18 => "Eighteen"}
  TENS = {20 => "Twenty",30 => "Thirty", 40 => "Fourty", 50 => "Fifty", 60 => "Sixty", 70 => "Seventy", 80 => "Eighty", 90 => "Ninety" }

  def to_words(integer)
    case
    when integer.unit?
      single_as_word integer
    when integer.teens?
      irregular_teens_as_word(integer) || normal_teens_as_word(integer)
    when integer.tens?
      tens_as_words integer
    end
  end



  private

  def single_as_word(integer)
    return false if UNITS[integer].nil?
    UNITS[integer]
  end

  def irregular_teens_as_word(integer)
    return false if IRREGULAR_TEENS[integer].nil?
    IRREGULAR_TEENS[integer]
  end

  def normal_teens_as_word(integer)
    base_number = integer.to_s[1].to_i
    UNITS[base_number] + "teen"
  end

  def tens_as_words(integer)
    base_number = integer.to_s[1].to_i
    TENS[integer.to_tens] + " " + UNITS[base_number]
  end
end