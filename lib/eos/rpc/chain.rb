module Eos
  module Rpc
    class Chain
      include HTTParty

      base_uri "#{Eos::Rpc::ENDPOINT}/v1/chain"

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

      def get_code(account_name)
        json = { account_name: account_name.to_s }.to_json
        self.class.post('/get_code', body: json).parsed_response
      end

      def get_table_rows(scope:, code:, table:, lower_bound: 0, upper_bound: -1, limit: 10)
        json = {
          scope: scope.to_s,
          code: code.to_s,
          table: table.to_s,
          json: true,
          lower_bound: upper_bound,
          upper_bound: lower_bound,
          limit: limit
        }.to_json
        self.class.post('/get_table_rows', body: json).parsed_response
      end

      def abi_json_to_bin(code:, action:, args: {})
        json = {
          code: code.to_s,
          action: action.to_s,
          args: args
        }.to_json
        self.class.post('/abi_json_to_bin', body: json).parsed_response
      end

      def abi_bin_to_json(code:, action:, binargs:)
        json = {
          code: code.to_s,
          action: action.to_s,
          binargs: binargs
        }.to_json
        self.class.post('/abi_bin_to_json', body: json).parsed_response
      end

      def push_transaction(transaction)
        self.class.post('/push_transaction', body: transaction.to_json).parsed_response
      end

      def get_required_keys(transaction:, available_keys: [])
        json = {
          transaction: transaction.to_hash,
          available_keys: available_keys
        }.to_json
        self.class.post('/get_required_keys', body: json).parsed_response
      end
    end
  end
end
