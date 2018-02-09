module Eos
  module Rpc
    class Wallet
      include HTTParty

      base_uri "#{Eos::Rpc::ENDPOINT}/v1/wallet"

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

      def unlock(name, key)
        self.class.post('/unlock', body: [name, key].to_json).parsed_response
      end

      def import_key(name, key)
        self.class.post('/import_key', body: [name, key].to_json).parsed_response
      end

      def list_wallets
        self.class.get('/list_wallets').parsed_response
      end

      def list_keys
        self.class.get('/list_keys').parsed_response
      end

      def get_public_keys
        self.class.get('/get_public_keys').parsed_response
      end

      def set_timeout(seconds)
        self.class.post('/get_public_keys', body: seconds.to_json).parsed_response
      end

      def sign_transaction(transaction, public_keys: [], chain_id: '')
        json = [transaction.to_hash, public_keys, chain_id].to_json
        self.class.post('/sign_transaction', body: json).parsed_response
      end
    end
  end
end
