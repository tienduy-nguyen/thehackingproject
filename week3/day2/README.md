# Practice TDD in Ruby

Solve the solution and make the test for them

- Ex1: Caesar's cipher

   Caesar's cipher shifts each letter by a number of letters. If the shift takes you past the end of the alphabet, just rotate back to the front of the alphabet. In the case of a rotation by 3, w, x, y and z would map to z, a, b and c.

   ```
    Original alphabet:      abcdefghijklmnopqrstuvwxyz
    Alphabet rotated +3:    defghijklmnopqrstuvwxyzabc
   ```
   ```ruby
    > caesar_cipher("What a string!", 5)
    => "Bmfy f xywnsl!"
   ```

- Ex2: Day Trader
  
  From an array of price, find the best day of purchase and the best day of sale to make the maximum profit
  ```ruby
  > day_trader([17, 3, 6, 9, 15, 8, 6, 1, 10])
  => [1,4]  # $15 - $3 == $12
  ```
- Ex3: Word counter
  
  We are an dictionary that contains the keywords. Input is a words or and phrase. We will count the number of occurences of each word in the dictionary.

  ```ruby
  > dictionnary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]
  > word_counter("below", dictionnary)
  => {"below"=>1, "low"=>1}
  > word_counter("Howdy partner, sit down! How's it going?", dictionnary)
  => {"down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, "it"=>2, "i"=> 3, "own"=>1,"part"=>1,"partner"=>1,"sit"=>1}

  ```
- Ex3: Count the word from the poem of shakepeare
  
  ```ruby
  dictionnary = ["the", "of", "and", "to", "a", "in", "for", "is", "on", "that", "by", "this", "with", "i", "you", "it", "not", "or", "be", "are"]
  ```
  
  We must use a txt file to save the poem of Shakepeare [shakespeare.txt](https://ocw.mit.edu/ans7870/6/6.006/s08/lecturenotes/files/t8.shakespeare.txt)

  Count the number of orcurrences of each word in the dictionary.

- Ex4: Count the bad words in the poem of Shakepeare
  
  [bad_word.txt](http://www.bannedwordlist.com/lists/swearWords.txt)
  