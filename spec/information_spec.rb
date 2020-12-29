require_relative '../lib/information'

describe 'variables' do
  it 'has to return an Array' do
    expect(variables.is_a?(Array)).to eql(true)
  end
end
