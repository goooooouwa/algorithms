require 'benchmark'
require 'rand_array'
require 'counting_sort'

describe '#counting_sort' do
  context 'with sorted array' do
    let(:array) { [1,2,3,4,5] }
    let(:array_sorted) {[1,2,3,4,5]}
    it 'output sorted array' do
      expect(counting_sort(array,5)).to match_array(array_sorted)
    end
  end
  context 'with reverse sorted array' do
    let(:array) { [5,4,3,2,1] }
    let(:array_sorted) {[1,2,3,4,5]}
    it 'output sorted array' do
      expect(counting_sort(array,5)).to match_array(array_sorted)
    end
  end
  context 'with same item array' do
    let(:array) { [0,1,0,1,0,1] }
    let(:array_sorted) {[0,0,0,1,1,1]}
    it 'output sorted array' do
      expect(counting_sort(array,5)).to match_array(array_sorted)
    end
  end
  it 'should sort 100000 items within 1s' do
    size = 100000
    result = Benchmark.measure { counting_sort(rand_array(size, size), size) }
    expect(result.real).to be < 1
  end
end
