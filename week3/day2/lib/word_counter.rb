dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]
dictionary2 = ["the", "of", "and", "to", "a", "in", "for", "is", "on", "that", "by", "this", "with", "i", "you", "it", "not", "or", "be", "are"]

def counter_helper(words,dictionary,results)
  list_word = words.downcase.split()
  list_word.each do |word|
    trim_word = word.dup
    while trim_word.strip.length > 0
      check = ''
      trim_word.split('').each do |char|
        check += char
        if results.key?(check)
          results[check] +=1
        end
      end
      trim_word = trim_word[1..-1]
    end
  end
  return results
end

def word_counter(words, dictionary)
  nums = Array.new(dictionary.length,0)
  results = dictionary.zip(nums).to_h
  counter_helper(words,dictionary,results)
  return results.reject{|k,v| v==0}
end

# puts word_counter("Howdy partner, sit down! How's it going?",dictionary)
# puts "a"[1..-1].length



def shakespeare_counter(file,dictionary)
  nums = Array.new(dictionary.length,0)
  results = dictionary.zip(nums).to_h
  File.open(file,'r') do |f|
      f.each_line do |line|
        line.downcase.split().each  do |word|
          if results.key?(word)
            results[word] +=1
          end
        end
      end
  end
  return results.reject{|k,v| v==0}
end

# p shakespeare_counter("lib/shakespeare.txt",dictionary2)

def count_bad_word(file_read, file_bad_word)
  results ={}
  File.open(file_bad_word,'r') do |f|
    f.each_line do |line|
      results[line.strip] = 0
    end
  end
  File.open(file_read,'r') do |f|
    f.each_line do |line|
      line.downcase.split().each  do |word|
        if results.key?(word)
          results[word] +=1
        end
      end
    end
  end
  return results.reject{|k,v| v==0}
end

puts count_bad_word("lib/shakespeare.txt","lib/bad_word.txt")