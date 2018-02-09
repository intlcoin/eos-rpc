module Eos
  module Rpc
    class Chain
      include HTTParty
      # debug_output
      base_uri 'testnet1.eos.io/v1/chain'

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
    end
  end
end
