require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Release Model" do
  it 'can construct a new instance' do
    @release = Release.new
    refute_nil @release
  end
end
