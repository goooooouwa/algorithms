require 'quick_sort'

def randomized_partition_select(array, p, r, k)
  q = partition(array,p,r)
  n = q-p+1
  if n < k
    randomized_partition_select(array,q+1,r,k-n)
  elsif n == k
    array[q]
  else
    randomized_partition_select(array,p,q-1,k)
  end
end