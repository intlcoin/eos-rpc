module Eos
  module Rpc
    class Chain
      include HTTParty
      # debug_output
      base_uri 'localhost:8888/v1/chain'

      def get_info
        self.class.get("/get_info").parsed_response
      end

      def get_block(block_num_or_id)
        json = { block_num_or_id: block_num_or_id.to_s }.to_json
        self.class.post('/get_block', body: json).parsed_response
      end

      def get_account(name)
        json = { name: name.to_s }.to_json
        self.class.post('/get_account', body: json).parsed_response
      end
    end
  end
end
