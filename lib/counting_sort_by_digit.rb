def counting_sort_by_digit(array, d)
  count = Array.new(10, 0)
  result = Array.new(array.length)
  # store the number of items equal value in count[value]
  for i in 0..array.length-1
    # calculate
    count[get_digit(array[i], d)] += 1
  end
  # store the number of items equal or smaller than value in count[value]
  for i in 1..count.length-1
    count[i] += count[i-1]
  end
  (array.length-1).downto(0) do |j|
    t = get_digit(array[j], d)
    result[count[get_digit(array[j], d)]-1] = array[j]
    count[t] -= 1
  end
  return result
end

def get_digit(n, d)
  raise ArgumentError, 'Digit must be greater than 0' unless d > 0
  if d == 1
    t = n
  else
    t = n/(10*(d-1))
  end
  t % 10
end