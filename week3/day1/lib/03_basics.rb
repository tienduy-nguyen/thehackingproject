def who_is_bigger(a,b,c)
  if a.nil? || b.nil? || c.nil?
    return "nil detected"
  end
  if a >= b && a >= c
    return "a is bigger"
  end
  if b >= a && b >= c
    return "b is bigger"
  end
  if c >= a && c >= a
    return "c is bigger"
  end

  
end

def reverse_upcase_noLTA(str)
  str.upcase.reverse.gsub(/[LTA]/,'')
end

def array_42(array) 
  array.include?(42)
end
def magic_array(array)
  array.flatten.sort.map{|x| x*2}.select{|x| x%3 != 0}.uniq
end