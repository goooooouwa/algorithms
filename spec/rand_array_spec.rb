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
