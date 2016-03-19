require 'quick_sort'

def randomized_select(array, p, r, k)
  q = randomized_partition(array,p,r)
  n = q-p+1
  if n < k
    randomized_select(array, q+1, r, k-n)
  elsif n == k
    array[q]
  else
    randomized_select(array, p, q-1, k)
  end
end