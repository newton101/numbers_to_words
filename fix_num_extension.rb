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

  def hundreds?
    (100..999).cover? self
  end

  def to_tens
    if self.tens?
      ten_number = self.to_s[0]
      (ten_number + "0").to_i
    else
      raise 'Cannot convert this number'
    end
  end

  def to_hundreds
    if self.hundreds?
      hundred_number = self.to_s[0]
      (hundred_number + "00").to_i
    else
      raise 'Cannot convert this number'
    end
  end

  def integer_size
    self.to_s.size
  end
end