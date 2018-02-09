module Eos
  module Rpc
    class Authorization
      def initialize(account:, permission:)
        @account = account
        @permission = permission
      end

      def to_hash
        {
          account: @account,
          permission: @permission
        }
      end
    end
  end
end
