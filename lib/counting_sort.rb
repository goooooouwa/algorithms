def counting_sort(array, k)
  count = Array.new(k+1, 0)
  result = Array.new(array.length)
  # store the number of items equal value in count[value]
  for i in 0..array.length-1
    count[array[i]] += 1
  end
  # store the number of items equal or smaller than value in count[value]
  for i in 1..count.length-1
    count[i] += count[i-1]
  end
  (array.length-1).downto(0) do |j|
    result[count[array[j]]-1] = array[j]
    count[array[j]] -= 1
  end
  return result
end
