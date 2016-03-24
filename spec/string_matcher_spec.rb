describe 'naive_string_matcher' do
  let(:text) { 'bacbababacabacababacabab' }
  let(:pattern) { 'ababaca' }
  let(:expected_shifts) { [4, 14] }
  it 'should find all valid shifts for the pattern in the text' do
    expect(naive_string_matcher(text,pattern)).to match_array(expected_shifts)
  end
end