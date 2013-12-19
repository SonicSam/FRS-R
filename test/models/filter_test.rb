require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Filter Model" do
  it 'can construct a new instance' do
    @filter = Filter.new
    refute_nil @filter
  end
end
