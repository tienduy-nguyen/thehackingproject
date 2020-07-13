# Temperature conversion
def ftoc(num)
  ((num-32)/1.8).round(2)
end 
def ctof(num)
  num*1.8.round(2)+32
end