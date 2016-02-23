class Cipher
  attr_reader :key

  ALPHABET = [*?a..?z]
  MAX_CHARS = 100

  def initialize(key=nil)
    validate!(key)
    @key = key || (ALPHABET.shuffle * 4).pop(MAX_CHARS).join
  end

  def encode(text)
    result = ''
    text.chars.each_with_index do |letter, index|
      result << new_letter(letter, distance_to_shift(key[index]))
    end
    result
  end

  def decode(text)
    result = ''
    text.chars.each_with_index do |letter, index|
      result << original_letter(letter, distance_to_shift(key[index]))
    end
    result
  end

  private

  def distance_to_shift(key_letter)
    ALPHABET.index(key_letter)
  end

  def new_letter(current_letter, distance)
    ALPHABET[(ALPHABET.index(current_letter) + distance) % ALPHABET.size]
  end

  def original_letter(current_letter, distance)
    ALPHABET[(ALPHABET.index(current_letter) - distance) % ALPHABET.size]
  end

  def validate!(key)
    return if key.nil?

    if key.match(/[A-Z]|\d|^$/)
      raise ArgumentError, 'invalid key'
    end
  end
end
