require 'rand_array'

describe '#rand_array' do
  let(:size) { 10 }
  let(:seed) { 1234 }
  let(:generated_array) do
    srand(seed)
    array = []
    size.times do
      array.push rand(size)
    end
    array
  end
  before :each do
    srand(seed)
  end
  it 'should generate a random array with given size' do
    expect(rand_array(size)).to match_array(generated_array)
  end
end

describe '#sorted_array' do
  let(:size) { 10 }
  let(:generated_array) { [0,1,2,3,4,5,6,7,8,9]}
  it 'should generate a sorted array with given size' do
    expect(sorted_array(size)).to match_array(generated_array)
  end
end

describe '#rand_string' do
  let(:size) { 10 }
  let(:seed) { 1234 }
  let(:generated_string) do
    srand(seed)
    o = [('A'..'Z'),('a'..'z')].map { |i| i.to_a }.flatten
    (1..size).map { o[rand(o.length)] }.join
  end
  before :each do
    srand(seed)
  end
  it 'should generate a random string with given size' do
    expect(rand_string(size)).to eq(generated_string)
  end
end