# Un program that allows from a price array, take the best day of purchase
# and the best day of sale to make the maximum profit
# > day_trader([17, 3, 6, 9, 15, 8, 6, 1, 10])
# => [1,4]  # $15 - $3 == $12

def day_trader(arr)
  max = 0
  result = []
  len=arr.length
  for i in 0..len-2
    for j in i+1..len-1
      if max < (arr[j] - arr[i])
        max= arr[j] -arr[i]
        result[0] = i
        result[1] = j
      end
    end
  end
  return result
end
p day_trader([17,3,6,9,15,8,6,1,10])