require 'my_logger'

describe MyLogger do
  it 'should only has one instance being created' do
    expect(MyLogger.instance).to eq(MyLogger.instance)
  end
end
