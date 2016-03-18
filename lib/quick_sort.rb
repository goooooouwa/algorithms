def quick_sort(array, p, r)
  if p < r
    q = partition(array, p, r)
    quick_sort(array, p, q-1)
    quick_sort(array, q+1, r)
  end
end

def partition(array, p, r)
  i = p
  for j in p..r-1
    if array[j] <= array[r]
      t = array[i]
      array[i] = array[j]
      array[j] = t
      i += 1
    end
  end
  t = array[i]
  array[i] = array[r]
  array[r] = t
  i
end

def randomized_quick_sort(array, p, r)
  if p < r
    q = randomized_partition(array, p, r)
    quick_sort(array, p, q-1)
    quick_sort(array, q+1, r)
  end
end

def randomized_partition(array, p, r)
  # randomly pick a pivot within array[p..r]
  i = rand(p..r)
  t = array[r]
  array[r] = array[i]
  array[i] = t
  partition(array, p, r)
end