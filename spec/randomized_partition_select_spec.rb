require 'benchmark'
require 'rand_array'
require 'randomized_partition_select'

describe '#randomized_partition_select' do
  context 'when the array is sorted' do
    let(:array) { [1,2,3,4,5] }
    let(:k) { 4 }
    let(:n) { 4 }
    it 'should select the k-th largest item in array with #randomized_partition' do
      expect(randomized_partition_select(array,0,array.length-1,k)).to eq(n)
    end
  end
  context 'when the array is reverse sorted' do
    let(:array) { [5,4,3,2,1] }
    let(:k) { 4 }
    let(:n) { 4 }
    it 'should select the k-th largest item in array with #randomized_partition' do
      expect(randomized_partition_select(array,0,array.length-1,k)).to eq(n)
    end
  end
  context 'when the array contains items with same value' do
    let(:array) { [0,1,0,1,0,1] }
    let(:k) { 4 }
    let(:n) { 1 }
    it 'should select the k-th largest item in array with #randomized_partition' do
      expect(randomized_partition_select(array,0,array.length-1,k)).to eq(n)
    end
  end
  context 'when the array contains 5 random items' do
    let(:array) { [1,9,7,4,6] }
    let(:k) { 4 }
    let(:n) { 7 }
    it 'should select the k-th largest item in array with #randomized_partition' do
      expect(randomized_partition_select(array,0,array.length-1,k)).to eq(n)
    end
  end
  context 'when the array contains 100000 random items' do
    let(:size) { 100000 }
    let(:k) { 4 }
    it 'should sort it within 100ms' do
      result = Benchmark.measure { randomized_partition_select(rand_array(size), 0, size-1, k) }
      expect(result.real).to be < 0.1
    end
  end
end