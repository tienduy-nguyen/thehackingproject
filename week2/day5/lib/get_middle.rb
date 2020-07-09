# You are going to be given a word. 
# Your job is to return the middle character of the word. 
# If the word's length is odd, return the middle character. 
# If the word's length is even, return the middle 2 characters.

# Example
# Kata.getMiddle("test") should return "es"

# Kata.getMiddle("testing") should return "t"

# Kata.getMiddle("middle") should return "dd"

# Kata.getMiddle("A") should return "A"

def get_middle(s)
  len = s.length
  if len <=1 
    return s
  end
  if len % 2 == 0 
    return s[len/2 -1] + s[len/2]
  else
    return s[len/2]
  end
end

def get_middle1(s)
  s[(s.size-1)/2..s.size/2]
end
def get_middle2(s)
  mid = (s.length - 1) / 2
  s.length.odd? ? s[mid] : s[mid..mid+1]
end


puts get_middle("test")
puts get_middle("testing")
puts get_middle("middle")
puts get_middle("A")
