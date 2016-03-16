def rand_array(length, range)
  array = []
  length.times do
    array.push rand(range)
  end
  array
end
