require "eos/rpc/version"
require "httparty"

module Eos
  module Rpc
    class Api
      include HTTParty
      debug_output
      base_uri 'localhost:8888/v1'

      def get_info
        response = self.class.get("/chain/get_info")
        JSON.parse response.body
      end

      def get_block(block_num_or_id)
        json = { block_num_or_id: block_num_or_id.to_s }.to_json
        response = self.class.post('/chain/get_block', body: json)
        JSON.parse response.body
      end
    end
  end
end
