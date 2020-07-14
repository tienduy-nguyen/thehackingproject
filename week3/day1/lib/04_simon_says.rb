def echo(str)
  str
end
def shout(str)
  str.upcase
end
def repeat(str, time=2)
  ("#{str} " * time).strip
end
def start_of_word(str, index)
str[0..index-1]
end
def first_word(str)
  str.split.first
end
def titleize(str)
  little_words = ["and", "the", "or"]
  words = str.split
  title_words = Array.new
  words.each_with_index do |word, index| 
    if index == 0
        word = word.capitalize
    else
        unless little_words.include?(word)
            word = word.capitalize
        end
    end
    title_words << word
  end
return title_words.join(' ')
end