require 'rand_array'

describe '#rand_array' do
  let(:length) { 10 }
  let(:range) { 100 }
  let(:seed) { 1234 }
  let(:generated_array) do
    srand(seed)
    array = []
    length.times do
      array.push rand(range)
    end
    array
  end
  before :each do
    srand(seed)
  end
  it 'should generates a random array with given length and range' do
    expect(rand_array(length, range)).to match_array(generated_array)
  end
end
