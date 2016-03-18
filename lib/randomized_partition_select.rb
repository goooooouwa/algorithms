require 'quick_sort'

def randomized_partition_select(array, p, r, k)
  q = randomized_partition(array,p,r)
  if q < k-1
    randomized_partition_select(array,q+1,r,k-q)
  elsif q == k-1
    array[q]
  else
    randomized_partition_select(array,p,q-1,k)
  end
end