def caesar_cipher(str, key)
  # a-z: 97-122
  # A-Z: 65-90
  upper = *(65..90)
  lower = *(97..122)
  result = []
  arr_str= str.split(' ')
  arr_str.each do |word|
    new_word = word.bytes.map do |x|
      if lower.include?(x)
        (x+key) <= 122 ? (x+key) : (x+key-122+96)
      elsif upper.include?(x)
        (x+key) <= 90 ? (x+key) : (x+key-90+64)
      else
        x
      end
    end
    new_word = new_word.map(&:chr).join
    result.push(new_word)
  end
  return result.join(' ')
end
p caesar_cipher("What a string!", 5)
