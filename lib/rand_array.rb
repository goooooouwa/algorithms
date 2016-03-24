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

def rand_string(size)
  o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
  (1..size).map do
    o[rand(o.length)]
  end.join
end