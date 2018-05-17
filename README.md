# Eos::Rpc Gem

Feature complete [EOS RPC API](https://eosio.github.io/eos/group__eosiorpc.html) for ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eos-rpc', github: 'intlcoin/eos-rpc'
```

And then execute:

    $ bundle

## Usage

See the [EOS RPC API docs](https://eosio.github.io/eos/group__eosiorpc.html).

```ruby
Eos::Rpc::Chain.new.get_info
=> {"server_version"=>"2cc40a4e", "head_block_num"=>2776321, "last_irreversible_block_num"=>2776307, "head_block_id"=>"002a5d01f8cf11c97af632ac488b74ea16f0b5a4a918449e62879bb59db8c9b9", "head_block_time"=>"2018-02-09T18:37:26", "head_block_producer"=>"initm", "recent_slots"=>"1111111111111111111111111111111111111111111111111111111111111111", "participation_rate"=>"1.00000000000000000"}

> Eos::Rpc::Wallet.new.create 'test'
=> "PW5KLfsevYxAzNuLiHHsPz3LhRYDTkN461qgXLdFitjzJ3uj2LAuQ"
```

By default gem uses public testnet endpoint `testnet1.eos.io`, you can override it by setting `EOS_RPC_ENDPOINT` environment variable

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/intlcoin/eos-rpc.
