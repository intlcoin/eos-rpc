require "httparty"

module Eos
  module Rpc
    ENDPOINT = ENV['EOS_RPC_ENDPOINT'] || 'testnet1.eos.io'
  end
end

Dir[File.dirname(__FILE__) + '/rpc/*.rb'].each do |file|
  require file
end
