def rand_array(size)
  array = []
  size.times do
    array.push rand(size)
  end
  array
end
