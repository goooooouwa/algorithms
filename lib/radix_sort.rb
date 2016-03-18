require 'counting_sort'

def radix_sort(array, d)
  for i in 1..d
    array = counting_sort_by_digit(array,i)
  end
end