# You are given an array (which will have a length of at least 3, but could be very large) containing integers. 
# The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N. 
# Write a method that takes the array as an argument and returns this "outlier" N.

# Example
# [2, 4, 0, 100, 4, 11, 2602, 36]
# Should return: 11 (the only odd number)

# [160, 3, 1719, 19, 11, 13, -21]
# Should return: 160 (the only even number)

def find_outlier(integers)
  is_all_even = integers[0..2].select{|x| x%2 ==0}.size > 1
  return is_all_even ? integers.select{|x| x%2 != 0}[0] : integers.select{|x| x%2 == 0}[0]
end

def find_outlier1(integers)
  integers.partition(&:odd?).find(&:one?).first
end

def find_outlier2(integers)
  outlier = integers.first(3).count(&:even?) < 2 ? :even? : :odd?
  integers.find(&outlier)
end

p find_outlier([2, 4, 0, 100, 4, 11, 2602, 36])