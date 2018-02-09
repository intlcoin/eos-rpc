module Eos
  module Rpc
    class Transaction
      def initialize(ref_block_num:, ref_block_prefix:, expiration:, scope: [], read_scope: [], messages: [], signatures: [])
        @ref_block_num = ref_block_num
        @ref_block_prefix = ref_block_prefix
        @expiration = expiration
        @scope = scope
        @read_scope = read_scope
        @messages = messages
        @signatures = signatures
      end

      def to_hash
        {
          ref_block_num: @ref_block_num,
          ref_block_prefix: @ref_block_prefix,
          expiration: @expiration,
          scope: @scope,
          read_scope: @read_scope,
          messages: @messages.map(&:to_hash),
          signatures: @signatures
        }
      end

      def to_json
        self.to_hash.to_json
      end
    end
  end
end
