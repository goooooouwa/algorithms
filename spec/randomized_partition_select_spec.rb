require 'randomized_partition_select'

describe '#randomized_partition_select' do
  let(:array) { [1,9,7,4,6] }
  let(:k) { 4 }
  let(:n) { 7 }
  it 'should select the k-th largest item in array with #randomized_partition' do
    expect(randomized_partition_select(array,0,array.length-1,k)).to eq(n)
  end
end