module Eos
  module Rpc
    class Wallet
      include HTTParty

      base_uri 'localhost:8888/v1/wallet'

      def create(name)
        self.class.post('/create', body: name.to_json).parsed_response
      end

      def open(name)
        self.class.post('/open', body: name.to_json).parsed_response
      end

      def lock(name)
        self.class.post('/lock', body: name.to_json).parsed_response
      end

      def lock_all
        self.class.post('/lock_all').parsed_response
      end
    end
  end
end
