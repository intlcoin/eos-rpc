$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "eos/rpc"

require "minitest/autorun"
require 'minitest/spec'
require "vcr"
require "minitest-vcr"
require "webmock"

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock
end

MinitestVcr::Spec.configure!
