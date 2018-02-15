require "test_helper"

describe Eos::Rpc::Chain, :vcr do
  before do
    @chain = Eos::Rpc::Chain.new
  end

  it "gets server info" do
    @chain.get_info.must_be_instance_of Hash
  end

  it "gets block by number or id" do
    @chain.get_block(5).must_be_instance_of Hash
  end

  it "it gets code by account name" do
    @chain.get_block('inita').must_be_instance_of Hash
  end
end
