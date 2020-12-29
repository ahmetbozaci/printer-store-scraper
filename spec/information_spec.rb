require_relative '../lib/information'

describe 'display' do
  it 'has to return nil' do
    expect(display.nil?).to eql(true)
  end
end

describe 'text' do
  it 'has to retun nil' do
    expect(text.nil?).not_to eql(false)
  end
end
