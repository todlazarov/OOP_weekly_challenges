class Cipher
  attr_reader :key

  ALPHABET = ('a'..'z').to_a
  MAX_CHARS = 100

  def initialize(key=nil)
    validate!(key)
    @key = key || generate_key
  end

  def encode(text)
    result = ''
    text.chars.each_with_index do |letter, index|
      key_letter = find_key_letter(index)
      distance_to_shift = find_distance_to_shift(key_letter)
      new_letter = find_new_letter(letter, distance_to_shift)
      result << new_letter
    end

    result
  end

  def decode(text)
    result = ''
    text.chars.each_with_index do |letter, index|
      key_letter =find_key_letter(index)
      distance_to_shift = find_distance_to_shift(key_letter)
      original_letter = find_original_letter(letter, distance_to_shift)
      result << original_letter
    end

    result
  end

  private

  def find_key_letter(index)
    key[index]
  end

  def find_distance_to_shift(key_letter)
    ALPHABET.index(key_letter)
  end

  def find_new_letter(current_letter, distance)
    index = ALPHABET.index(current_letter)
    if (index + distance) > (ALPHABET.size - 1)
      return ALPHABET[(index + distance) - ALPHABET.size]
    else
      return ALPHABET[index + distance]
    end
  end

  def find_original_letter(current_letter, distance)
    index = ALPHABET.index(current_letter)
    if (index - distance) < 0
      ALPHABET[ALPHABET.size - (distance - index)]
    else
      return ALPHABET[index - distance]
    end
  end

  def generate_key
    (ALPHABET.shuffle * 4).pop(100).join
  end

  def validate!(key)
    return if key.nil?

    if key.match(/[A-Z]|\d|^$/)
      raise ArgumentError, 'invalid key'
    end
  end
end
