# Simple, given a string of words, return the length of the shortest word(s).

# String will never be empty and you do not need to account for different data types.

def find_short(s)
  return s.split(' ').min_by{|word| word.length}.length
end

def find_short1(s)
  s.split.map(&:size).min
end

puts find_short("bitcoin take over the world maybe who knows perhaps")