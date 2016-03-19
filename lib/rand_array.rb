def rand_array(size)
  array = []
  size.times do
    array.push rand(size)
  end
  array
end

def sorted_array(size)
  Array.new(size) { |index| index }
end