module Eos
  module Rpc
    class Message
      def initialize(code:, type:, authorization: [], data: )
        @code = code
        @type = type
        @authorization = authorization
        @data = data
      end

      def to_hash
        {
          code: @code,
          type: @type,
          authorization: @authorization.map(&:to_hash),
          data: @data
        }
      end
    end
  end
end
