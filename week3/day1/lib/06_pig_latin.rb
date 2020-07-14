def translate(str)
  # aeiou
  # Get list array from string
  # And loop through each word in this list
  words = str.split(' ')
  str_final  = ''
  words.each do |word|
    # Detect the first vowel in each word
    split_vowel = word.split /([aeio].*)/

    # Recursion result
    str_final = str_final + split_vowel.last + split_vowel.first + 'ay '
  end
  return str_final.strip
end

# puts translate("apple")
# puts translate("banana")
# puts translate("eat pie")
# puts translate("cherry")
# puts translate("three")
# puts translate("quite")