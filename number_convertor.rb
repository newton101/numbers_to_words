require './fix_num_extension'

class NumberConvertor
  UNITS = {0 => "", 1 => "One", 2 => "Two", 3 => "Three", 4 => "Four", 5 => "Five", 6 => "Six", 7 => "Seven", 8 => "Eight", 9 => "Nine"}
  TEENS = {10 => "Ten", 11 => "Eleven", 12 => "Twelve", 13 => "Thirteen", 14 => "Fourteen",  15 => "Fifteen",16 => "Sixteen", 17 => "Seventeen", 18 => "Eighteen", 19 => "Nineteen"}
  TENS = {20 => "Twenty",30 => "Thirty", 40 => "Fourty", 50 => "Fifty", 60 => "Sixty", 70 => "Seventy", 80 => "Eighty", 90 => "Ninety" }
  JOINER = {4 => "thousand", 5 => "thousand", 6 => "thousand", 7 => "million"}


  def to_words(integer)
    raise 'Error converting this number' if wordify(integer).nil?
    wordify(integer).rstrip
  end

  def wordify(integer)
    case
    when integer.unit?
      single_as_word integer
    when integer.teens?
      teens_as_word(integer)
    when integer.tens?
      tens_as_words integer
    when integer.hundreds?
      hundreds_as_words integer
    else
      big_number_as_word integer
    end
  end

  def big_number_as_word(integer)
    number_of_digits =  integer.integer_size
    cut_off_point = comma_point(number_of_digits)
    wordified_number = split_and_wordify(integer, cut_off_point)
    truncate_and(wordified_number)
  end


  private

  def single_as_word(integer)
    return false if UNITS[integer].nil?
    UNITS[integer]
  end

  def teens_as_word(integer)
    return false if TEENS[integer].nil?
    TEENS[integer]
  end

  def tens_as_words(integer)
    unit_number = integer.to_s[1].to_i
    TENS[integer.to_tens] + " " + UNITS[unit_number]
  end

  def hundreds_as_words(integer)
    non_hundred = integer - integer.to_hundreds
    hundred_number = integer.to_s[0].to_i
    UNITS[hundred_number] + " hundred and " + wordify(non_hundred)
  end

  def split_and_wordify(integer, cut_off_point)
    first_part = integer.to_s[0...cut_off_point].to_i
    second_part = integer.to_s[cut_off_point..integer.integer_size].to_i
    wordify(first_part) +" "+ JOINER[integer.integer_size] + " "+ wordify(second_part)
  end

  def comma_point(number_of_digits)
    (number_of_digits - 1) % 3 + 1
  end

  def truncate_and(wordified_number)
    split_word = wordified_number.split
    if split_word.last == "and"
       split_word.delete_at(-1)
    end
    split_word.join(' ')
  end
end