require 'pry'

class Fixnum
  def to_roman
    "#{thousands}#{hundreds}#{tens}#{ones}"
  end

  def ones
    result = ''
    remainder = self % 10
    return 'IV' if remainder == 4
    return 'IX' if remainder == 9
    return 'V' if remainder == 5
    if remainder < 5
      remainder.times { result << 'I'}
    elsif remainder > 5
      result = 'V'
      (remainder- 5).times {result << 'I'}
    end
    result
  end

  def tens
    result = ''
    remainder = (self % 100) / 10
    return 'XL' if remainder == 4
    return 'XC' if remainder == 9
    return 'L' if remainder == 5
    if remainder < 5
      remainder.times {result << 'X'}
    elsif remainder > 5
      result = 'L'
      (remainder - 5).times {result << 'X'}
    end
    result
  end

  def hundreds 
    result = ''
    remainder = (self % 1000) / 100
    return 'CD' if remainder == 4
    return 'CM' if remainder == 9
    return 'D' if remainder == 5
    if remainder < 5
      remainder.times {result << 'C'}
    elsif remainder > 5
      result = 'D'
      (remainder - 5).times {result << 'C'}
    end
    result
  end

  def thousands
    result = ''
    remainder = (self % 10000) / 1000
    remainder.times {result << 'M'}
    result
  end

end