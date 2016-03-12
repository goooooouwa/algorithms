def rand_array(length, range)
  array = []
  prand = Random.new
  length.times do
    array.push prand.rand(range)
  end
  array
end
