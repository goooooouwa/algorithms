require 'merge_sort'

describe '#merge_sort' do
  context 'with sorted array' do
    let(:array) { [1,2,3,4,5] }
    let(:array_sorted) {[1,2,3,4,5]}
    it 'output sorted array' do
      expect(merge_sort(array,0,array.length-1)).to match_array(array_sorted)
    end
  end
  context 'with reverse sorted array' do
    let(:array) { [5,4,3,2,1] }
    let(:array_sorted) {[1,2,3,4,5]}
    it 'output sorted array' do
      expect(merge_sort(array,0,array.length-1)).to match_array(array_sorted)
    end
  end
  context 'with same item array' do
    let(:array) { [0,1,0,1,0,1] }
    let(:array_sorted) {[0,0,0,1,1,1]}
    it 'output sorted array' do
      expect(merge_sort(array,0,array.length-1)).to match_array(array_sorted)
    end
  end
end