module Eos
  module Rpc
    class Wallet
      include HTTParty

      base_uri 'localhost:8888/v1/wallet'

      def create(name)
        self.class.post('/create', body: name.to_json).parsed_response
      end

      # def get_block(block_num_or_id)
      #   json = { block_num_or_id: block_num_or_id.to_s }.to_json
      #   self.class.post('/get_block', body: json).parsed_response
      # end
    end
  end
end
